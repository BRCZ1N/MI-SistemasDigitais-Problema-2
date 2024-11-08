#include "game.h"
#include <stdio.h>

#define WIDTH 80
#define HEIGHT 60

int bitmap[HEIGHT][WIDTH];

void create_bitmap() {
    for (int i = 0; i < HEIGHT; i++) {
        for (int j = 0; j < WIDTH; j++) {
            // Calcular índice linear a partir das coordenadas bidimensionais
            int index = i * WIDTH + j;
            switch (bitmap[i][j])
            {
            case 0x000000: // Preto 
                bitmap[i][j] = 0;
                break;
            case 0xFFFFFF: // Branco
                bitmap[i][j] = 1;
                break;
            case 0xFF0000: // Vermelho
                bitmap[i][j] = 2;
                break;
            case 0x0000FF: // Azul 
                bitmap[i][j] = 3;
                break;
            case 0x00FFFF: // Ciano
                bitmap[i][j] = 4;
                break;
            case 0xFF00FF: // Magenta 
                bitmap[i][j] = 5;
                break;
            case 0xFFFF00: // Amarelo
                bitmap[i][j] = 6;
                break;
            case 0x00FF00: // Verde
                bitmap[i][j] = 7;
                break;
            default:
                break;
            }
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



