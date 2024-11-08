
#include "prototype.h"
#include "start.h"
#include "over.h"

void gameOverTela(){
    for (int i = 0; i < 4; i++) {
        renderBitmap(80, 60, gameover4frame_data[i]);
    }
}

void startGameTela(){
    setBackgroundColor(7, 7, 7);
    for (int i = 0; i < 6; i++) {
        renderBitmap(80, 60, start6frames_data[i]);
    }
}

void renderBitmap(int width, int height, int bitmap[HEIGHT][WIDTH]) {

    for (int i = 0; i < height; i++) {
        for (int j = 0; j < width; j++) {
            if (bitmap[i][j] == 1) {
                switch (bitmap[i][j])
            {
            case 0xff000000: // Preto 
                setBackgroundBlock(j, i, 0, 0, 0);
                break;
            case 0xffffffff: // Branco
                setBackgroundBlock(j, i, 7, 7, 7);
                break;
            case 0xff0000ff: // Vermelho
                setBackgroundBlock(j, i, 7, 0, 0);
                break;
            case 0xffff0000: // Azul 
                setBackgroundBlock(j, i, 0, 0, 7);
                break;
            case 0xffffff00: // Ciano
               setBackgroundBlock(j, i, 0, 7, 7);
                break;
            case 0xffff00ff: // Magenta 
                setBackgroundBlock(j, i, 7, 0, 7);
                break;
            case 0xff00ffff: // Amarelo
                setBackgroundBlock(j, i, 7, 7, 0);
                break;
            case 0xff00ff00: // Verde
                setBackgroundBlock(j, i, 0, 7, 0);
                break;
            default:
                break;
            
            }
        }
    }
}
}

