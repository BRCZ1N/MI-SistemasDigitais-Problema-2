.section .text
.global set_sprite

set_sprite:
    # Recebe argumentos (registrador, x, y, offset, activation_bit)
    # Argumentos esperados em: r4 = registrador, r5 = x, r6 = y, r7 = offset, r8 = activation_bit

    # Criar o valor de 'dataA' usando deslocamentos e operadores lógicos
    slli    r9, r7, 16           # r9 = offset << 16
    slli    r10, r4, 8           # r10 = registrador << 8
    or      r9, r9, r10          # r9 = (offset << 16) | (registrador << 8)
    or      r9, r9, r8           # r9 = dataA = (offset << 16) | (registrador << 8) | activation_bit

    # Criar o valor de 'dataB' (x e y)
    slli    r11, r5, 16          # r11 = x << 16
    or      r11, r11, r6         # r11 = dataB = (x << 16) | y

    # Escrever dataA e dataB nos registradores de saída (GPIOs mapeados)
    movia   r12, DATAA_ADDRESS   # Endereço mapeado de saída de dataA
    stw     r9, 0(r12)           # Escreve o valor de dataA no endereço de saída

    movia   r13, DATAB_ADDRESS   # Endereço mapeado de saída de dataB
    stw     r11, 0(r13)          # Escreve o valor de dataB no endereço de saída

    # Gerar o pulso de escrita
    movia   r14, START_ADDRESS   # Endereço mapeado para start
    movi    r15, 1               # Coloca o sinal de start em nível lógico alto (1)
    stw     r15, 0(r14)          # Gera o pulso de escrita

    # Espera breve para garantir que o pulso foi processado
    movi    r15, 0
    stw     r15, 0(r14)          # Coloca start em nível lógico baixo (0)

    # Retorna 1 para indicar sucesso
    movi    r2, 1                # Retorno de sucesso no registrador r2
    ret

    set_background_color:
    # Recebe os parâmetros (R, G, B) nos registradores
    # r4 = R (Vermelho), r5 = G (Verde), r6 = B (Azul)

    # Criar o valor de 'dataA' para o registrador de background
    movi    r9, 1                 # r9 = 1 (activation_bit)
    slli    r9, r9, 0             # O registrador e o offset são 0, então nada muda
                                   # Resultado final: r9 = (0 << 16) | (0 << 8) | 1

    # Criar o valor de 'dataB' com as cores RGB
    slli    r10, r4, 16            # r10 = R << 16
    slli    r11, r5, 8             # r11 = G << 8
    or      r10, r10, r11          # r10 = (R << 16) | (G << 8)
    or      r10, r10, r6           # r10 = (R << 16) | (G << 8) | B

    # Escrever dataA e dataB nos registradores de saída (GPIOs mapeados)
    movia   r12, DATAA_ADDRESS     # Endereço mapeado para saída de dataA
    stw     r9, 0(r12)             # Escreve o valor de dataA no endereço de saída

    movia   r13, DATAB_ADDRESS     # Endereço mapeado para saída de dataB
    stw     r10, 0(r13)            # Escreve o valor de dataB no endereço de saída

    # Gerar o pulso de escrita
    movia   r14, START_ADDRESS     # Endereço mapeado para o sinal de start
    movi    r15, 1                 # Coloca o sinal de start em nível lógico alto (1)
    stw     r15, 0(r14)            # Gera o pulso de escrita

    # Espera breve para garantir que o pulso foi processado
    movi    r15, 0
    stw     r15, 0(r14)            # Coloca o sinal de start novamente em nível lógico baixo (0)

    # Retorna 1 para indicar sucesso
    movi    r2, 1                  # Retorno de sucesso no registrador r2
    ret