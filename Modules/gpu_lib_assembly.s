    .section .data
DEVICE_PATH:
    .asciz "/dev/gpu_device"    // Caminho para o dispositivo da GPU

fd: 
    .word 0                     // File descriptor da GPU

    .section .text
    .global open_gpu_device
    .global close_gpu_device
    .global set_sprite
    .global set_background_color

// Função open_gpu_device
open_gpu_device:
    PUSH    {LR}
    
    LDR     R0, =DEVICE_PATH     // Carrega o caminho do dispositivo
    MOV     R1, #1               // O_WRONLY (escrita)
    BL      open                 // Chama syscall open
    
    CMP     R0, #0               // Verifica o retorno
    BLT     error_open           // Se erro, vai para error_open
    
    STR     R0, =fd              // Armazena file descriptor
    MOV     R0, #1               // Retorna 1 (sucesso)
    B       end_open
    
error_open:
    MOV     R0, #-1              // Retorna -1 (erro)
    BL      perror               // Mostra erro
    
end_open:
    POP     {LR}
    BX      LR

// Função close_gpu_device
close_gpu_device:
    PUSH    {LR}
    LDR     R0, =fd              // Carrega o file descriptor
    LDR     R0, [R0]             // Acessa o valor
    BL      close                // Chama syscall close
    POP     {LR}
    BX      LR

// Função set_sprite
set_sprite:
    PUSH    {LR}
    SUB     SP, SP, #28           // Espaço para 'command'
    
    MOV     R3, #1                // command[0] = 1
    STRB    R3, [SP]
    
    MOV     R3, R1                // command[1] = reg
    STRB    R3, [SP, #1]
    
    MOV     R3, R4, LSR #1        // command[2] = (offset >> 1) & 0xFF
    STRB    R3, [SP, #2]
    
    MOV     R3, R4, LSL #7
    ORR     R3, R3, R2, LSR #3    // command[3]
    STRB    R3, [SP, #3]
    
    MOV     R3, R2, LSL #5
    ORR     R3, R3, R3, LSR #5    // command[4]
    STRB    R3, [SP, #4]
    
    MOV     R3, R3, LSL #3        // command[5]
    STRB    R3, [SP, #5]
    
    STRB    R5, [SP, #6]          // command[6] = sp
    
    LDR     R0, =fd               // File descriptor
    MOV     R1, SP                // Buffer 'command'
    MOV     R2, #7                // Tamanho do comando
    BL      write                 // Chama syscall write
    
    CMP     R0, #0
    BLT     error_sprite           // Se falha, vai para erro
    
    MOV     R0, #1                // Retorna 1 (sucesso)
    B       end_sprite
    
error_sprite:
    MOV     R0, #0                // Retorna 0 (erro)
    BL      perror                // Exibe erro
    
end_sprite:
    ADD     SP, SP, #28           // Desaloca espaço na pilha
    POP     {LR}
    BX      LR

// Função set_background_color
set_background_color:
    PUSH    {LR}
    
    SUB     SP, SP, #4           // Espaço para 'command'
    
    MOV     R3, #0               // command[0] = 0
    STRB    R3, [SP]
    
    STRB    R1, [SP, #1]         // command[1] = R
    STRB    R2, [SP, #2]         // command[2] = G
    STRB    R3, [SP, #3]         // command[3] = B
    
    LDR     R0, =fd              // Carrega file descriptor
    MOV     R1, SP               // Buffer 'command'
    MOV     R2, #4               // Tamanho do comando (4 bytes)
    BL      write                // Chama syscall write
    
    CMP     R0, #0
    BLT     error_bg_color        // Verifica se falhou
    
    MOV     R0, #1               // Retorna 1 (sucesso)
    B       end_bg_color
    
error_bg_color:
    MOV     R0, #0               // Retorna 0 (erro)
    BL      perror               // Exibe erro
    
end_bg_color:
    ADD     SP, SP, #4           // Libera espaço na pilha
    POP     {LR}
    BX      LR
