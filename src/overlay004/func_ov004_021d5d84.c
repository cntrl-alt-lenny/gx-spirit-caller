/* func_ov004_021d5d84: drive the 0x0500045e backdrop palette with a triangle-
 * wave grayscale from the frame counter (021040ac.2C + 02104f4c, 0..31 fold). */
#include "ov004_core.h"
extern char data_021040ac[];
extern char data_02104f4c[];
void func_ov004_021d5d84(void) {
    int v = (*(int *)(data_021040ac + 0x2C) + *(int *)data_02104f4c) & 63;
    if (v >= 32) v = 31 - (v - 32);
    *(volatile unsigned short *)0x0500045E = v | (v << 5) | (v << 10);
}
