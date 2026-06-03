/* func_ov016_021b6324: zero the BG scroll registers (0x04000014/18) and reset
 * subsystem B; return 1. */
#include "ov016_core.h"
extern void func_ov016_021b7fbc(void *a);
int func_ov016_021b6324(void) {
    char *reg = (char *)0x04000014;
    *(int *)reg = 0;
    *(int *)(reg + 4) = 0;
    func_ov016_021b7fbc(data_ov016_021bb2c4);
    return 1;
}
