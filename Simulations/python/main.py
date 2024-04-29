instrucciones = """
40000513
00500593
04500293
29a00313
00000393
02f00e13
00e00e93
00552023
00652223
00752423
01c52623
01d52823
008000ef
08000a63
fec10113
00812023
00912223
01212423
01312623
01412823
01512a23
00050413
00058493
00048913
00000993
04094263
00000993
fff90293
0259d863
00098313
00231313
00640333
00430393
00032a03
0003aa83
014ad663
0143a023
01532023
00198993
fc000ae3
fff90913
fc0000e3
00012403
00412483
00812903
00c12983
01012a03
01412a83
01410113
000080e7
00052283
00452303
00852383
00c52e03
01052e83

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
