instrucciones = """
00200513
00400593
04c000ef
0a000063
ff410113
00812023
00912223
01212423
00050413
00058493
00000913
00048863
00890933
fff48493
fe000ae3
00090513
00012403
00412483
00812903
00c10113
000080e7
ff010113
00812023
00912223
01212423
00112623
00a00433
00b004b3
00100913
00048e63
00090513
00040593
f91ff0ef
00050913
fff48493
fe0004e3
00090513
00012403
00412483
00812903
00c12083
01010113
000080e7
00050513


"""

# Eliminar espacios en blanco y dividir en líneas
instrucciones = instrucciones.strip().split("\n")

# Función para dividir cada línea en bytes
def dividir_en_bytes(instruccion):
    bytes_separados = [instruccion[i:i+2] for i in range(0, len(instruccion), 2)]
    return " ".join(bytes_separados)

# Aplicar la función a cada línea de instrucciones
instrucciones_bytes = [dividir_en_bytes(instruccion) for instruccion in instrucciones]

# Imprimir el resultado
for instruccion in instrucciones_bytes:
    print(instruccion)
