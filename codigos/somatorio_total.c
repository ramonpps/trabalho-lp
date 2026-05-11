#include <stdio.h>

int main() {
    int total = 0;
    for(int idx = 0; idx < 10; idx++) {
        total = total + idx;
    }
    return total;
}