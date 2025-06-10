import pyodbc
from Conexion import obtener_conexion

#Hacer la conexión a la base de datos
conexion = obtener_conexion()
cursor = conexion.cursor()

def historial_pago(id_estudiante):
    try: 
        # Ejecutar consulta sobre el procedimiento almacenado sp_historial_pago
        cursor.execute("EXEC sp_historial_pago ?", id_estudiante)
        
        # Obtener los resultados de la consulta
        resultados = cursor.fetchall()
    
    except pyodbc.Error as ex:
        print(f"Ocurrió un error al ver el historial de pagos: {ex}")
    
    # Si no se encontraron resultados, mostrar mensaje
    if not resultados:
        print("No se encontraron pagos para el estudiante con ID:", buscar_historial_estudiante)
        
    # Mostrar encabezado de la tabla
    else:
        print("\n\t\t\t\t\t--- HISTORIAL DE PAGOS ---")
        print(f"{'Carnet':<5} {'Nombre':<20} {'Apellido':<20} {'ID Talonario':<20} {'Estado':<20} {'Fecha':<12}")
        print("-" * 120)

        # Mostrar los datos de cada fila
        for fila in resultados:
            id_est, nombre, apellido, talonario, estado_colegiatura, fecha = fila
            print(f"{id_est:<5} {nombre:<20} {apellido:<20} {talonario:<20} {estado_colegiatura:<20} {fecha.strftime('%Y-%m-%d'):<12}")

# Ejecutar función
buscar_historial_estudiante = int(input("\nIngrese el ID del estudiante para ver su historial de pagos: "))

if buscar_historial_estudiante <= 0:
    print("El ID del estudiante debe ser un número positivo.")
    
else:
    historial_pago(buscar_historial_estudiante)
