.equ sys_open, 5        @Valor da syscall de abertura de arquivos
.equ sys_map, 192       @Valor da syscall de mapeamento de memória (gera endereço virtual)
.equ page_len, 4096     @Tamanho da memória a ser utilizada para mapear, em número de páginas de memória (4096 = 1 página)
.equ prot_read, 1       @Flag para modo de leitura do arquivo "\dev\mem"
.equ prot_write, 2      @Flag para modo de escrita do arquivo "\dev\mem"
.equ map_shared, 1      @Libera compartilhamento de memória

.macro setOut pin
    LDR R2, =\pin
    LDR R2, [R2]
    LDR R1, [R8, R2]
    LDR R3, =\pin
    ADD R3, #4
    LDR R3, [R3]
    MOV R0, #0b111
    LSL R0, R3
    BIC R1, R0
    MOV R0, #1
    LSL R0, R3
    ORR R1, R0
    STR R1, [R8, R2]
.endm

mapping:

    LDR R0, =fileName
    MOV R2, #0x1b0
    ORR R2, #0x006
    MOV R1, R2
    MOV R7, #sys_open
    SWI 0
    MOVS R4, R0

    LDR R5, =gpioaddr
    LDR R5, [R5]
    MOV R1, #page_len
    MOV R2, #(prot_read + prot_write)
    MOV R3, #map_shared
    MOV R0, #0
    MOV R7, #sys_map
    SWI 0
    MOVS R8, R0

    BX LR

.data
fileName: 
        .asciz "/dev/mem"     @Diretório usado para o mapeamento de memória
gpioaddr: 
        .word 0x20200         @Endereço dos GPIO / 4096

ALT_LWFPGASLVS_OFST: @ Armazena o endereço de offset do barramento "Lightweight HPS-to-FPGA AXI" em relação ao endereço base do HPS.

                   .word 0xFF200000

HW_REGS_BASE: @ Armazena o endereço base para os registradores de acesso aos periféricos do HPS.
       
            .word 0xFC000000

HW_REGS_SPAN: @ Armazena o comprimento em bytes da região de memória a ser mapeada.

            .word 0x04000000
