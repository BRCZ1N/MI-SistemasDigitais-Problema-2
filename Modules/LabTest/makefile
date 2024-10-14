# Makefile para compilar arquivos C para assembly

# Compilador
CC = gcc

# Opções de compilação
CFLAGS = -S

# Arquivos fonte
SRCS = gpu_lib.c 

# Arquivos assembly gerados
ASMS = $(SRCS:.c=.s)

# Alvo padrão
all: $(ASMS)

# Regra para compilar arquivos C em arquivos assembly
%.s: %.c
	$(CC) $(CFLAGS) $< -o $@

# Limpeza
clean:
	rm -f $(ASMS)

.PHONY: all clean
