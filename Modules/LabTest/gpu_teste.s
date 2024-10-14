.section .text
.global set_sprite
.global set_background_color

set_sprite:
    MOV     R9, R7.section .data
DATAA_ADDRESS: .word 0x80
DATAB_ADDRESS: .word 0x70
START_ADDRESS: .word 0xFC000000

.section .text
.global set_sprite
.global set_background_color

set_sprite:
    MOV     R9, R7
    LSL     R9, R9, #16
    LSL     R10, R4, #8
    ORR     R9, R9, R10
    ORR     R9, R9, R8

    MOV     R11, R5
    LSL     R11, R11, #16
    ORR     R11, R11, R6

    LDR     R12, =0x80
    LDR     R12, [R12]          @ Carrega o valor do endereço
    STR     R9, [R12]

    LDR     R13, =0x70
    LDR     R13, [R13]          @ Carrega o valor do endereço
    STR     R11, [R13]

    LDR     R14, =0xFC000000
    LDR     R14, [R14]          @ Carrega o valor do endereço
    MOV     R15, #1
    STR     R15, [R14]

    MOV     R15, #0
    STR     R15, [R14]

    MOV     R0, #1
    BX      LR

set_background_color:
    MOV     R9, #1

    MOV     R10, R4
    LSL     R10, R10, #16
    MOV     R11, R5
    LSL     R11, R11, #8
    ORR     R10, R10, R11
    ORR     R10, R10, R6

    LDR     R12, =0x80
    LDR     R12, [R12]          @ Carrega o valor do endereço
    STR     R9, [R12]

    LDR     R13, =0x70
    LDR     R13, [R13]          @ Carrega o valor do endereço
    STR     R10, [R13]

    LDR     R14, =0xFC000000
    LDR     R14, [R14]          @ Carrega o valor do endereço
    MOV     R15, #1
    STR     R15, [R14]

    MOV     R15, #0
    STR     R15, [R14]

    MOV     R0, #1
    BX      LR
 #16
    LSL     R10, R4, #8
    ORR     R9, R9, R10
    ORR     R9, R9, R8

    MOV     R11, R5
    LSL     R11, R11, #16
    ORR     R11, R11, R6

    LDR     R12, 0x80  @ Carrega o valor do endereço diretamente
    STR     R9, [R12]

    LDR     R13, 0x70   @ Carrega o valor do endereço diretamente
    STR     R11, [R13]

    LDR     R14, 0xFC000000    @ Carrega o valor do endereço diretamente
    MOV     R15, #1
    STR     R15, [R14]

    MOV     R15, #0
    STR     R15, [R14]

    MOV     R0, #1
    BX      LR

set_background_color:
    MOV     R9, #1

    MOV     R10, R4
    LSL     R10, R10, #16
    MOV     R11, R5
    LSL     R11, R11, #8
    ORR     R10, R10, R11
    ORR     R10, R10, R6

    LDR     R12, 0x80    @ Carrega o valor do endereço diretamente
    STR     R9, [R12]

    LDR     R13, 0x70     @ Carrega o valor do endereço diretamente
    STR     R10, [R13]

    LDR     R14, 0xFC000000      @ Carrega o valor do endereço diretamente
    MOV     R15, #1
    STR     R15, [R14]

    MOV     R15, #0
    STR     R15, [R14]

    MOV     R0, #1
    BX      LR
