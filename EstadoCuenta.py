import pyodbc
from Conexion import obtener_conexion

def estado_cuenta(id_estudiante):
    # Este bloque importa la conexión y el cursor desde conexion.py
    conexion = obtener_conexion()
    cursor = conexion.cursor()
    
    try: 
        # Ejecutar consulta sobre el procedimiento almacenado sp_historial_pago
        cursor.execute("EXEC spu_estado_cuenta ?", id_estudiante)
        
        # Obtener los resultados de la consulta
        resultados = cursor.fetchall()
    
    # Bloque para manejar errores
    # Aquí se captura cualquier error con la base de datos
    except pyodbc.Error as ex:
        print(f"Ocurrió un error al ver el estado de cuenta: {ex}")
    
    # Si no se encontraron resultados, mostrar mensaje
    if not resultados:
        print("No se encontraron pagos para el estudiante con ID:", id_estudiante)
        
    # Mostrar encabezado de la tabla
    else:
        print("\n\t\t\t\t\t\t\t\t\t--- ESTADO DE CUENTA ---")
        print(f"{'Carnet':<7} {'Nombre':<20} {'Apellido':<20} {'Correo':<30} {'ID Talonario':<15} {'Cuota':<10} {'Meses Pendientes':<17}  {'Monto Pendiente':<17}  {'Ultimo mes pagado':<15} ")
        print("-" * 160)

        for fila in resultados:
            id_est, nombre, apellido, correo, talonario, cuota, mesesPendientes, montoTotal, ultimoMes = fila
            print(f"{id_est:<7} {nombre:<20} {apellido:<20} {correo:<30} {talonario:<15} {float(cuota):<10.2f} {mesesPendientes:<17} {float(montoTotal):<17.2f} {ultimoMes.strftime('%Y-%m-%d'):<15}")
