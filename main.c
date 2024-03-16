#include <stdio.h>
#include <stdint.h>
#include <string.h>
#include <stdlib.h>

extern uint64_t endian_swap(uint64_t x);

int main() {
    char input[100];
    uint32_t value;

    while(1) {
        printf("Enter a hexadecimal number: ");
        scanf("%99s", input);

        if(strcmp(input, "break") == 0 || strcmp(input, "exit") == 0) {
            break;
        }

        // convert to hexadecimal
        value = (uint32_t) strtol(input, NULL, 16);

        uint32_t swapped = endian_swap(value);

        printf("Original: 0x%x\n", value);
        printf("Swapped: 0x%x\n\n", swapped);

    }

    return 0;
}
