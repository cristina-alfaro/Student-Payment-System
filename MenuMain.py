def mostrar_menu():
    print("\n*** SISTEMA DE PAGO DE COLEGIATURAS ***")
    print("1. Registrar estudiante")
    print("2. Registrar pago")
    print("3. Ver historial de pagos")
    print("4. Consultar estado de cuenta")
    print("5. Ver estudiantes con saldo pendiente")
    print("6. Salir")
    opcion = int(input("Ingrese la opcion a realizar\n"))

    def registrar_estudiante(): #Evil Michelle
        print("Codigo 1")

    def registrar_pago(): # Mundo
        print("Codigo 2")

    def ver_historial_pagos(): #LISTO
        print("Codigo 3")

    def consultar_estado_cuenta(): #LISTO
        print("Codigo 4")
        
    def ver_estudiantes_con_saldo_pendiente(): #LISTO
        print("Codigo 5")

    def salir():
        print("Codigo 6")

    def default():
        print("Default")

    # Diccionario de funciones
    opciones_menu = {
        1: registrar_estudiante,
        2: registrar_pago,
        3: ver_historial_pagos,
        4: consultar_estado_cuenta,
        5: ver_estudiantes_con_saldo_pendiente,
        6: salir,
    }
    opciones_menu.get(opcion,default)()
    
mostrar_menu()


