#include "interface.h"
#include <stdio.h>

#define WIDTH 80
#define HEIGHT 60

int bitmap[HEIGHT][WIDTH];

void create_bitmap() {
    for (int i = 0; i < HEIGHT; i++) {
        for (int j = 0; j < WIDTH; j++) {
            // Calcular índice linear a partir das coordenadas bidimensionais
            int index = i * WIDTH + j;
            bitmap[i][j] = (interface_data[2][index] == 0xFF000000) ? 1 : 0;
        }
    }
}

void renderBitmap(int width, int height, int bitmap[HEIGHT][WIDTH]) {

    int colors[7][3] = {{0, 0, 0}, {0, 0, 7}, {0, 7, 0}, {0, 7, 7}, {7, 0, 0}, {7, 0, 7}, {7, 7, 0}};
    int c = 0;

    for (int i = 0; i < height; i++) {
        (c == 6) ? c = 0 : c++;
        for (int j = 0; j < width; j++) {
            if (bitmap[i][j] == 1) {
                // Chama setBackgroundBlock com a cor preta (7, 7, 7) para os pixels pretos
                //setBackgroundBlock(j, i, colors[c][0], colors[c][1], colors[c][2]);
            }
        }
    }
}

int img[60][80];

int main() {
    // Criar a matriz bitmap
    create_bitmap();
    // Exemplo de impressão do bitmap para verificar
    for (int i = 0; i < HEIGHT; i++) {
        printf("{");
        for (int j = 0; j < WIDTH; j++) {
            (bitmap[i][j] == 1) ? printf("%d,", 1) : printf("%d,", 0);
        }
        printf("},");
        printf("\n");
       
    }

    return 0;
}



