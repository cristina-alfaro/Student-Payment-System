import pyodbc
from Conexion import obtener_conexion

def ver_estudiantes_con_saldo_pendiente():
    # Este bloque importa la conexión y el cursor desde conexion.py
    conexion = obtener_conexion()
    cursor = conexion.cursor()
    
    try: 
        # Ejecutar consulta sobre la vista v_estudiantes_pendientes
        cursor.execute("SELECT * FROM v_estudiantes_pendientes WHERE mesesPendientes > 0")
        # Obtener los resultados de la consulta
        resultados = cursor.fetchall()
        
    # Bloque para manejar errores
    # Aquí se captura cualquier error con la base de datos
    except pyodbc.Error as ex:
        print(f"Ocurrió un error al ver los estudiantes pendientes: {ex}")
        
    # Verificar si hay resultados
    if cursor.rowcount == 0:
        print("\nNo hay estudiantes con saldo pendiente.")
        return
    
    # Mostrar encabezado de la tabla
    print("\n\t\t\t\t\t\t--- ALUMNOS CON PAGOS PENDIENTES ---")
    print(f"{'Carnet':<7} {'Nombre':<20} {'Apellido':<20} {'Correo':<30} {'ID Talonario':<15} {'Meses Pagados':<15} {'Meses Pendientes':<17}")
    print("-" * 140)

    for fila in resultados:
        id_est, nombre, apellido, correo, talonario, mesesPagados, mesesPendientes = fila
        print(f"{id_est:<7} {nombre:<20} {apellido:<20} {correo:<30} {talonario:<15} {mesesPagados:<15} {mesesPendientes:<17}")
    