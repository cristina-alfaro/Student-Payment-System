import RegistroEstudiante  # Importa la función registrar_estudiante
import RegistroPagos   # Importa la función registrar_pago
import Pendientes  # Importa la función estudiantes_pendientes
import HistorialPago       # Importa la función historial_pago
import EstadoCuenta        # Importa la función estado_cuenta

def mostrar_menu():
    while True:
        print("\n*** SISTEMA DE PAGO DE COLEGIATURAS ***")
        print("1. Registrar estudiante") 
        print("2. Registrar pago") 
        print("3. Ver estudiantes pendientes de pago") 
        print("4. Ver historial de pagos") 
        print("5. Consultar estado de cuenta") 
        print("6. Salir") 
        try:
            opcion = int(input("Ingrese la opción a realizar: "))
        except ValueError:
            print("Por favor, ingresa un número válido.")
            continue

        if opcion == 1:
            RegistroEstudiante.registrar_alumno()
            
        elif opcion == 2:
            RegistroPagos.registrar_pago()
            
        elif opcion == 3:
            Pendientes.ver_estudiantes_con_saldo_pendiente()
            
        elif opcion == 4:
            id_estudiante = int(input("\nIngrese el ID del estudiante para ver su historial de pagos: "))
            # Validar que el ID del estudiante sea un número positivo
            if id_estudiante <= 0:
                print("El ID del estudiante debe ser un número positivo.")
            else:
                HistorialPago.historial_pago(id_estudiante)
                
        elif opcion == 5:
            id_estudiante = int(input("\nIngrese el ID del estudiante para ver su estado de cuenta: "))
            # Validar que el ID del estudiante sea un número positivo
            if id_estudiante <= 0:
                print("El ID del estudiante debe ser un número positivo.") 
            else:
                EstadoCuenta.estado_cuenta(id_estudiante)
                
        elif opcion == 6:
            print("Saliendo del sistema...")
            exit(0)  # Termina el programa
        else:
            print("Opción inválida. Por favor, selecciona una opción válida.")

# Ejecuta el menú
mostrar_menu()
