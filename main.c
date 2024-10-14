// Declaração da função extern
extern int set_background_color(int R, int G, int B);


#include <stdio.h>

// Declaração da função extern para a função implementada em Assembly
extern int set_background_color(int R, int G, int B);

int main() {
    // Definir os valores de RGB
    int red = 255;   // Valor máximo de vermelho
    int green = 0;   // Sem verde
    int blue = 128;  // Azul médio
    
    // Chamar a função set_background_color com os valores RGB
    int result = set_background_color(red, green, blue);
    
    if (result == 1) {
        printf("Background color set successfully!\n");
    } else {
        printf("Failed to set background color.\n");
    }
    
    return 0;
}