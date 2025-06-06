#Libreria para conectar sql server con python
import pyodbc

# Esta es una variable que guarda los datos de la conexión del servidor SQL
server = 'WORLDALONSO\\SQLEXPRESS'
database = 'BD_proyecto_control_pagos_colegiatura'
# Conexión al servidor SQL usando autenticación de Windows
conexion = pyodbc.connect(
    driver='{ODBC Driver 17 for SQL Server}',  # Asegúrate de que el driver esté instalado
    server=server,
    database=database,  # Esta parte conecta a la base de datos que vamos a usar
    trusted_connection='yes',  # Esta parte habilita la autenticación de Windows
    autocommit=True  # Esta parte habilita el autocommit para evitar problemas de transacción
)

cursor = conexion.cursor()
print("Conexión exitosa a la base de datos", database)

# Ejecutamos el comando create database
try:
    cursor.execute("Select * from alumno")
    rows = cursor.fetchall() # Esta parte obtiene todas las filas de la consulta

    # Mostramos los datos que obtenemos de la consulta
    for row in rows:
        print(row) # Imprimimos cada fila
except Exception as e:
    print(f"Ocurrió un error al ejecutar la consulta: {e}")

# Cerramos la conexión al final de todo
conexion.close()
