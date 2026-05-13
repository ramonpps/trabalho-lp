#include <stdio.h>

int main() {
    int acumulador = 0;
    for(int i = 0; i < 10; i++) {
        acumulador = acumulador + i;
    }
    return acumulador;
}