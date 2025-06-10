from Conexion import obtener_conexion

#Hacer la conexión a la base de datos
conexion = obtener_conexion()
cursor = conexion.cursor()

def historial_pago(id_estudiante):
    # Ejecutar consulta sobre el procedimiento almacenado sp_historial_pago
    cursor.execute("EXEC sp_historial_pago ?", id_estudiante)
    
    # Obtener los resultados de la consulta
    resultados = cursor.fetchall()
    
    # Si no se encontraron resultados, mostrar mensaje
    if not resultados:
        print("No se encontraron pagos para el estudiante con ID:", buscar_historial_estudiante)
        
    # Mostrar encabezado de la tabla
    print("\n\t\t\t\t\t--- HISTORIAL DE PAGOS ---")
    print(f"{'Carnet':<5} {'Nombre':<20} {'Apellido':<20}  {'Fecha':<12} {'Total ($)':<10} {'Pagado ($)':<12} {'Vuelto ($)':<12} {'Periodo':<10} {'Método':<10}")
    print("-" * 120)

    # Mostrar los datos de cada fila
    for fila in resultados:
        id_est, nombre, apellido, fecha, total, pagado, periodo, metodo = fila
        print(f"{id_est:<5} {nombre:<20} {apellido:<20} {fecha.strftime('%Y-%m-%d'):<12} {float(total):<10.2f} {float(pagado):<12.2f} {float(pagado-total):<12.2f} {periodo:<10} {metodo:<10}")

    # Cerrar el cursor y la conexión
    cursor.close()
    conexion.close()

# Ejecutar función
buscar_historial_estudiante = int(input("\nIngrese el ID del estudiante para ver su historial de pagos: "))

if buscar_historial_estudiante <= 0:
    print("El ID del estudiante debe ser un número positivo.")
    
else:
    historial_pago(buscar_historial_estudiante)
