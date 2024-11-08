
#include "prototype.h"
#include "start.h"
#include "over.h"


void gameOverTela(){
   for (int h = 0; h< OVER_FRAME; h++){
        for (int i = 0; i < OVER_HEIGHT; i++) {
            for (int j = 0; j < OVER_WIDTH; j++) {
                int index = i * OVER_WIDTH + j;
                switch (gameover4frame_data[h][index]){
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
                    setBackgroundBlock(j, i, 7, 0, 7);
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
        videoClear();
    }
}


void startGameTela() {
   for (int h = 0; h< START_FRAME; h++){
        usleep(100000);
        for (int i = 0; i < START_HEIGHT; i++) {
            for (int j = 0; j < START_WIDTH; j++) {
                int index = i * START_WIDTH + j;
                switch (start6frames_data[h][index]){
                    case 0xff000000: // Preto virou branco 
                        setBackgroundBlock(i, j, 7, 7, 7);
                        break;
                    case 0xffffffff: // 
                        break;
                    case 0xff0000ff: // Vermelho
                        setBackgroundBlock(i, j, 7, 0, 0);
                        break;
                    case 0xffff0000: // Azul 
                        setBackgroundBlock(i, j, 0, 0, 7);
                        break;
                    case 0xffffff00: // Ciano
                    setBackgroundBlock(i, j, 0, 7, 7);
                        break;
                    case 0xffff00ff: // Magenta 
                        setBackgroundBlock(i, j, 0, 7, 7);
                        break;
                    case 0xff00ffff: // Amarelo
                        setBackgroundBlock(i, j, 7, 7, 0);
                        break;
                    case 0xff00ff00: // Verde
                        setBackgroundBlock(i, j, 0, 7, 0);
                        break;
                    default:
                        break;
                }
            }
        }
        usleep(100000);
        for (int i = 0; i < 5; i++) {
            for (int j = 0; j < START_WIDTH; j++) {
                    setBackgroundBlock(i, j, 0, 0, 0);
            }
        }
        for (int i = 39; i < 60; i++) {
            for (int j = 0; j < START_WIDTH; j++) {
                    setBackgroundBlock(i, j, 0, 0, 0);
            }
        }
        usleep(100000);
    }
}
