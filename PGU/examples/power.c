#include <stdint.h>

uint64_t power(uint64_t base, uint64_t exp) {
    uint64_t result = 1;
    while (exp > 0) {
        result *= base;
        exp--;
    }
    return result;
}
