.global ASSEMBLEINSTRUCTIONWBR
ASSEMBLEINSTRUCTIONWBR:
    @ Entradas: R, G, B (valores de cor)
    @ Saída: endereço de um array de 8 bytes

    @ Alocar espaço para o array (WORD[8])
    SUB SP, SP, #8            @ Aloca 8 bytes no stack

    @ Configura o primeiro byte com opcode (WBR_OPCODE)
    MOV R0, #0x0             @ WBR_OPCODE = 0b0000
    STRB R0, [SP]            @ Armazena no primeiro byte (WORD[0])

    @ Configura o campo do registrador (BACKGROUND_REG)
    MOV R0, #0x0             @ BACKGROUND_REG = 0b0000
    ORR R0, R0, R0, LSL #4   @ Move para os 4 bits mais significativos
    STRB R0, [SP]            @ Armazena no primeiro byte (WORD[0])

    @ Configura o campo de cor (RGB) na segunda metade (WORD[4], WORD[5])

    @ Configura os 3 bits de R
    MOV R0, R1               @ R1 = R
    AND R0, R0, #0x07        @ R0 = R1 & 0x07 (máscara para pegar 3 bits)
    STRB R0, [SP, #4]        @ Armazena em WORD[4]

    @ Configura os 3 bits de G
    MOV R0, R2               @ R2 = G
    AND R0, R0, #0x07        @ R0 = R2 & 0x07
    ORR R0, R0, R0, LSL #3   @ Move para a posição de G
    STRB R0, [SP, #4]        @ Armazena em WORD[4]

    @ Configura os 2 bits de B
    MOV R0, R3               @ R3 = B
    AND R0, R0, #0x03        @ R0 = R3 & 0x03 (máscara para pegar 2 bits)
    ORR R0, R0, R0, LSL #6   @ Move para a posição de B
    STRB R0, [SP, #4]        @ Armazena em WORD[4]

    @ Configura os bits restantes de B (bit mais significativo)
    MOV R0, R3               @ R3 = B
    AND R0, R0, #0x04        @ R0 = R3 & 0x04 (bit mais significativo)
    STRB R0, [SP, #5]        @ Armazena no sexto byte (WORD[5])

    @ Retorna o endereço de WORD[8] (agora em SP)
    MOV R0, SP
    ADD SP, SP, #8           @ Restaura o stack
    BX LR                    @ Retorna da função
