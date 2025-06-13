import pyodbc
from Conexion import obtener_conexion
from datetime import datetime

# Este bloque importa la conexión y el cursor desde conexion.py
conexion = obtener_conexion()
cursor = conexion.cursor()

def registrar_pago():
    # Solicitar datos al usuario para registrar el pago
    id_talonario = input("Ingrese el ID del talonario: ")
    estado_colegiatura = input("Ingrese el estado de la colegiatura (pagado/no pagado): ")
    fecha_pago = input("Ingrese la fecha de pago (YYYY-MM-DD): ")

    # Validar el formato de la fecha de pago
    try:
        fecha_pago = datetime.strptime(fecha_pago, '%Y-%m-%d').date()
    # Si la fecha no es válida, se captura la excepción
    except ValueError:
        print("Fecha no válida. Asegúrese de usar el formato YYYY-MM-DD.")
        return

    # Registrar el pago en la base de datos
    try:
        cursor.execute("EXEC spu_agregar_registro_pagos ?, ?, ?", id_talonario, estado_colegiatura, fecha_pago)
        conexion.commit()
        print("Pago registrado exitosamente.")
        
    # Bloque para manejar errores
    # Aquí se captura cualquier error con la base de datos
    except pyodbc.Error as ex:
        print(f"Ocurrió un error al registrar el pago: {ex}")
        return

    # Obtener los datos para generar la factura
    try:
        # Ejecutar el procedimiento almacenado para generar la factura
        cursor.execute("EXEC spu_generar_factura ?", id_talonario)
        # Obtener el resultado de la consulta
        resultado = cursor.fetchone()

        if resultado:
            (
                id_alumno, nombres, apellidos, id_talonariopk,
                ultimo_pago, estado, nombre_cuota, precio, mora, mesespendientes, 
            ) = resultado

            fecha_actual = datetime.now().date()
            
            # Ingresar el monto de efectivo recibido para la factura
            try: 
                efectivo_recibido = float(input("Ingrese el monto de efectivo recibido: $"))
            except ValueError:
                print("Monto no válido. Asegúrese de ingresar un número.")
                return
            if efectivo_recibido < precio:
                print("El monto recibido es menor que el precio a pagar. Por favor, verifique el monto.")
                return
            if efectivo_recibido <= 0:
                print("El monto recibido debe ser un número positivo.")
                return
            
            # Calcular el vuelto
            vuelto = efectivo_recibido - precio 

            # Generar nombre del archivo
            nombre_archivo = f"factura-{fecha_actual}-{nombres.strip()}-{apellidos.strip()}.txt".replace(" ", "_")

            # Calcular total
            if mesespendientes > 0:
                total = precio + (precio * mora)
                mora_aplicada = mora * 100
            else:
                total = precio
                mora_aplicada = 0

            # Crear la factura en un archivo de texto
            with open(nombre_archivo, "w", encoding="utf-8") as f:
                f.write("====== FACTURA DE PAGO ======\n")
                f.write(f"Fecha de emisión: {fecha_actual}\n\n")
                f.write(f"Nombre del estudiante: {nombres} {apellidos}\n")
                f.write(f"ID Talonario: {id_talonario}\n")
                f.write(f"Fecha de último pago registrado: {ultimo_pago}\n")
                f.write(f"Estado de colegiatura: {estado}\n")
                f.write(f"Tipo de cuota: {nombre_cuota}\n")
                f.write(f"Precio base: ${precio:.2f}\n")
                f.write(f"Mora aplicada: {mora_aplicada:.0f}%\n")
                f.write(f"Total a pagar: ${total:.2f}\n")
                f.write(f"Efectivo recibido: ${efectivo_recibido:.2f}\n")
                f.write(f"Vuelto: ${vuelto:.2f}\n")
                f.write("\nGracias por su pago.\n")
                f.write("=============================\n")

            print(f"Factura generada: {nombre_archivo}")
        else:
            # Si no se encontraron datos para el talonario ingresado
            print("No se encontraron datos para el talonario ingresado.")
            
    # Bloque para manejar errores
    except pyodbc.Error as ex:
        print(f"Error al generar la factura: {ex}")
