import pyodbc

def obtener_conexion():
    # Esta es una variable que guarda los datos de la conexión del servidor SQL
    # Asegúrate de que el servidor y la base de datos sean correctos
    server = 'DESKTOP-BFC4931'
    database = 'BD_proyecto_control_pagos_colegiatura'

    # Conexión al servidor SQL usando autenticación de Windows
    conexion = pyodbc.connect(
        driver = '{ODBC Driver 17 for SQL Server}',  # Asegúrate de que el driver esté instalado
        server = server, # Esta parte conecta al servidor SQL con la variable server
        database = database,  # Esta parte conecta a la base de datos que vamos a usar con la variable database
        trusted_connection='yes',  # Esta parte habilita la autenticación de Windows
    )

    cursor = conexion.cursor()
    print("Conexión exitosa a la base de datos", database)

    return conexion