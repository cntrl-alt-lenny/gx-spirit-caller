/* func_ov011_021ccad8: in view-mode 3, fetch coord (021d1080) for the 600
 * actor; if it moved, store it (230/234), run 021ccf3c, clear 270 bit-28 and
 * return 1; else 0. */
#include "ov011_core.h"
extern void func_ov011_021d1080(int slot, int *out_x, int *out_y);
extern void func_ov011_021ccf3c(void);
int func_ov011_021ccad8(void) {
    char *s = data_ov011_021d403c;
    int xy[2];
    if (((unsigned int)(*(int *)(data_ov011_021d4000 + 0x27C) << 29) >> 29) == 3) {
        func_ov011_021d1080((unsigned int)(*(int *)(s + 0x258) << 14) >> 24, &xy[1], &xy[0]);
        if (*(int *)(s + 0x230) != xy[1] || *(int *)(s + 0x234) != xy[0]) {
            *(int *)(s + 0x230) = xy[1];
            *(int *)(s + 0x234) = xy[0];
            func_ov011_021ccf3c();
            *(int *)(s + 0x270) &= ~0x10000000;
            return 1;
        }
    }
    return 0;
}
