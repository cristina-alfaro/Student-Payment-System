from Conexion import obtener_conexion
from datetime import datetime

conexion = obtener_conexion()

def registrar_alumno():
    print("\n" + "=" * 50)
    print("  Bienvenido al Centro de Registro de Estudiantes  ")
    print("=" * 50)
    print("Favor de llenar los siguientes campos a continuación:\n")

    try:
        id_alumnopk = input("Ingrese el código del alumno: ")
        nombres = input("Ingrese los nombres del alumno: ")
        apellidos = input("Ingrese los apellidos del alumno: ")
        ver_secciones = input("¿Desea ver el listado de las secciones con su código? (si/no): ").strip().lower()

        with conexion.cursor() as cursor:
            if ver_secciones == 'si':
                cursor.execute("SELECT * FROM vista_secciones")
                secciones = cursor.fetchall()
                print("\nListado de Secciones:")
                print("-" * 25)
                for seccion in secciones:
                    print(f"| Código: {seccion[0]:<8} | Nombre: {seccion[1]:<13} |")
                print("-" * 25)
            else:
                print("Continuando con el registro del alumno...")

        id_seccionfk = input("Ingrese el código de la sección: ")
        estado = input("Ingrese el estado del alumno (1 para activo, 0 para inactivo): ")
        direccion = input("Ingrese la dirección del alumno: ")
        genero = input("Ingrese el género del alumno: ")
        edad = input("Ingrese la edad del alumno: ")
        correo = input("Ingrese el correo del alumno: ")

        with conexion.cursor() as cursor:
            cursor.execute(
                "EXEC spu_insertar_alumno ?, ?, ?, ?, ?, ?, ?, ?, ?",
                (id_alumnopk, nombres, apellidos, id_seccionfk, int(estado), direccion, genero, edad, correo)
            )
            conexion.commit()
            print("Alumno registrado exitosamente.")

        registrar_encargado(id_alumnopk)
        registrar_talonario(id_alumnopk)

    except Exception as e:
        print(f"Error al registrar el alumno: {e}")
        conexion.rollback()

def registrar_encargado(id_alumnofk):
    print("\n" + "=" * 50)
    print("  Bienvenido al Centro de Registro de Encargados  ")
    print("=" * 50)
    print("Favor de llenar los siguientes campos a continuación:\n")

    try:
        nombres = input("Ingrese los nombres del encargado: ")
        apellidos = input("Ingrese los apellidos del encargado: ")
        correo = input("Ingrese el correo del encargado: ")

        with conexion.cursor() as cursor:
            cursor.execute(
                "EXEC spu_insertar_encargado ?, ?, ?, ?",
                (nombres, apellidos, correo, id_alumnofk)
            )
            conexion.commit()
            print("Encargado registrado exitosamente.")

    except Exception as e:
        print(f"Error al registrar el encargado: {e}")
        conexion.rollback()

def registrar_talonario(id_alumnofk):
    print("\n" + "=" * 50)
    print("  Bienvenido al Centro de Registro de Talonarios  ")
    print("=" * 50)
    print("Favor de llenar los siguientes campos a continuación:\n")

    try:
        id_talonariopk = input("Ingrese el ID del talonario: ")
        codigo_talonario_alumno = input("Ingrese el código del talonario del alumno: ")
        id_cuotafk = input("Ingrese el ID de la cuota: ")

        with conexion.cursor() as cursor:
            cursor.execute(
                "INSERT INTO talonario (id_talonariopk, codigo_talonario_alumno, id_cuotafk, id_alumnofk, id_colegiofk) VALUES (?, ?, ?, ?, 1834)",
                (id_talonariopk, codigo_talonario_alumno, id_cuotafk, id_alumnofk)
            )
            conexion.commit()
            print("Talonario registrado exitosamente.")

        while True:
            print("\n¿Qué desea hacer a continuación?")
            print("1. Registrar otro alumno")
            print("2. Regresar al menú principal")

            opcion = input("Selecciona una opción: ")
            if opcion == '1':
                registrar_alumno()
                break
            elif opcion == '2':
                import Menu
                Menu.mostrar_menu()
                break
            else:
                print("Opción inválida. Intenta de nuevo.")

    except Exception as e:
        print(f"Error al registrar el talonario: {e}")
        conexion.rollback()
