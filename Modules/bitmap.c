#define CHAR_SIZE 5

unsigned short char_bitmaps[37][CHAR_SIZE][CHAR_SIZE] = {
    // A
    {
        {0,1,1,1,0},
        {1,0,0,0,1},
        {1,1,1,1,1},
        {1,0,0,0,1},
        {1,0,0,0,1}
    },
    // B
    {
        {1,1,1,1,0},
        {1,0,0,0,1},
        {1,1,1,1,0},
        {1,0,0,0,1},
        {1,1,1,1,0}
    },
    // C
    {
        {0,1,1,1,1},
        {1,0,0,0,0},
        {1,0,0,0,0},
        {1,0,0,0,0},
        {0,1,1,1,1}
    },
    // D
    {
        {1,1,1,1,0},
        {1,0,0,0,1},
        {1,0,0,0,1},
        {1,0,0,0,1},
        {1,1,1,1,0}
    },
    // E
    {
        {1,1,1,1,1},
        {1,0,0,0,0},
        {1,1,1,1,0},
        {1,0,0,0,0},
        {1,1,1,1,1}
    },
    // F
    {
        {1,1,1,1,1},
        {1,0,0,0,0},
        {1,1,1,1,0},
        {1,0,0,0,0},
        {1,0,0,0,0}
    },
    // G
    {
        {0,1,1,1,1},
        {1,0,0,0,0},
        {1,0,0,1,1},
        {1,0,0,0,1},
        {0,1,1,1,1}
    },
    // H
    {
        {1,0,0,0,1},
        {1,0,0,0,1},
        {1,1,1,1,1},
        {1,0,0,0,1},
        {1,0,0,0,1}
    },
    // I
    {
        {1,1,1,1,1},
        {0,0,1,0,0},
        {0,0,1,0,0},
        {0,0,1,0,0},
        {1,1,1,1,1}
    },
    // J
    {
        {0,1,1,1,1},
        {0,0,0,0,1},
        {0,0,0,0,1},
        {1,0,0,0,1},
        {0,1,1,1,0}
    },
    // K
    {
        {1,0,0,0,1},
        {1,0,0,1,0},
        {1,1,1,0,0},
        {1,0,0,1,0},
        {1,0,0,0,1}
    },
    // L
    {
        {1,0,0,0,0},
        {1,0,0,0,0},
        {1,0,0,0,0},
        {1,0,0,0,0},
        {1,1,1,1,1}
    },
    // M
    {
        {1,0,0,0,1},
        {1,1,0,1,1},
        {1,0,1,0,1},
        {1,0,0,0,1},
        {1,0,0,0,1}
    },
    // N
    {
        {1,0,0,0,1},
        {1,1,0,0,1},
        {1,0,1,0,1},
        {1,0,0,1,1},
        {1,0,0,0,1}
    },
    // O
    {
        {0,1,1,1,0},
        {1,0,0,0,1},
        {1,0,0,0,1},
        {1,0,0,0,1},
        {0,1,1,1,0}
    },
    // P
    {
        {1,1,1,1,0},
        {1,0,0,0,1},
        {1,1,1,1,0},
        {1,0,0,0,0},
        {1,0,0,0,0}
    },
    // Q
    {
        {0,1,1,1,0},
        {1,0,0,0,1},
        {1,0,0,0,1},
        {1,0,1,0,1},
        {0,1,1,1,1}
    },
    // R
    {
        {1,1,1,1,0},
        {1,0,0,0,1},
        {1,1,1,1,0},
        {1,0,1,0,0},
        {1,0,0,1,0}
    },
    // S
    {
        {0,1,1,1,1},
        {1,0,0,0,0},
        {0,1,1,1,0},
        {0,0,0,0,1},
        {1,1,1,1,0}
    },
    // T
    {
        {1,1,1,1,1},
        {0,0,1,0,0},
        {0,0,1,0,0},
        {0,0,1,0,0},
        {0,0,1,0,0}
    },
    // U
    {
        {1,0,0,0,1},
        {1,0,0,0,1},
        {1,0,0,0,1},
        {1,0,0,0,1},
        {0,1,1,1,0}
    },
    // V
    {
        {1,0,0,0,1},
        {1,0,0,0,1},
        {1,0,0,0,1},
        {0,1,0,1,0},
        {0,0,1,0,0}
    },
    // W
    {
        {1,0,0,0,1},
        {1,0,0,0,1},
        {1,0,1,0,1},
        {1,1,0,1,1},
        {1,0,0,0,1}
    },
    // X
    {
        {1,0,0,0,1},
        {0,1,0,1,0},
        {0,0,1,0,0},
        {0,1,0,1,0},
        {1,0,0,0,1}
    },
    // Y
    {
        {1,0,0,0,1},
        {0,1,0,1,0},
        {0,0,1,0,0},
        {0,0,1,0,0},
        {0,0,1,0,0}
    },
    // Z
    {
        {1,1,1,1,1},
        {0,0,0,1,0},
        {0,0,1,0,0},
        {0,1,0,0,0},
        {1,1,1,1,1}
    },
    // 0
    {
        {0,1,1,1,0},
        {1,0,0,0,1},
        {1,0,1,0,1},
        {1,0,0,0,1},
        {0,1,1,1,0}
    },
    // 1
    {
        {0,0,1,0,0},
        {0,1,1,0,0},
        {1,0,1,0,0},
        {0,0,1,0,0},
        {1,1,1,1,1}
    },
    // 2
    {
        {1,1,1,1,0},
        {0,0,0,0,1},
        {0,1,1,1,0},
        {1,0,0,0,0},
        {1,1,1,1,1}
    },
    // 3
    {
        {1,1,1,1,0},
        {0,0,0,0,1},
        {0,1,1,1,0},
        {0,0,0,0,1},
        {1,1,1,1,0}
    },
    // 4
    {
        {1,0,0,0,1},
        {1,0,0,0,1},
        {1,1,1,1,1},
        {0,0,0,0,1},
        {0,0,0,0,1}
    },
    // 5
    {
        {1,1,1,1,1},
        {1,0,0,0,0},
        {1,1,1,1,0},
        {0,0,0,0,1},
        {1,1,1,1,0}
    },
    // 6
    {
        {0,1,1,1,1},
        {1,0,0,0,0},
        {1,1,1,1,0},
        {1,0,0,0,1},
        {0,1,1,1,0}
    },
    // 7
    {
        {1,1,1,1,1},
        {0,0,0,0,1},
        {0,0,0,1,0},
        {0,0,1,0,0},
        {0,1,0,0,0}
    },
    // 8
    {
        {0,1,1,1,0},
        {1,0,0,0,1},
        {0,1,1,1,0},
        {1,0,0,0,1},
        {0,1,1,1,0}
    },
    // 9
    {
        {0,1,1,1,0},
        {1,0,0,0,1},
        {0,1,1,1,1},
        {0,0,0,0,1},
        {1,1,1,1,0}
    },
    // :
    {
    {0,0,0,0,0},
    {0,0,1,0,0},
    {0,0,0,0,0},
    {0,0,1,0,0},
    {0,0,0,0,0}
    }
};

// Função para imprimir um caractere
void printChar(int coordX, int coordY, char caracter, short color) {
    int index = charToIndex(caracter);
    int SIZE = 1;
    int initialX1, initialY1, finalX2, finalY2;

    for (int i = 0; i < CHAR_SIZE; i++) {
        for (int j = 0; j < CHAR_SIZE; j++) {
            if (char_bitmaps[index][i][j] == 1)
                initialX1 = coordX + j * (SIZE);
                initialY1 = coordY + i * (SIZE);
                finalX2 = initialX1 + SIZE;
                finalY2 = initialY1 + SIZE;
                videoBox(initialX1, initialY1, finalX2, finalY2, color, 1);
        }
    }
}

// Função para mapear o caractere para o índice na matriz
int charToIndex(char c) {
    if (c >= 'A' && c <= 'Z') {
        return c - 'A';
    } else if (c >= '0' && c <= '9') {
        return c - '0' + 26;
    } else {
        return 36;  // Caractere inválido
    }
}