/* func_ov016_021b61d0: zero the BG scroll registers (0x04000014/18) and reset
 * subsystem B; return 1. */
#include "ov016_core.h"
extern void func_ov016_021b7e50(void *a);
int func_ov016_021b61d0(void) {
    char *reg = (char *)0x04000014;
    *(int *)reg = 0;
    *(int *)(reg + 4) = 0;
    func_ov016_021b7e50(data_ov016_021bb164);
    return 1;
}
