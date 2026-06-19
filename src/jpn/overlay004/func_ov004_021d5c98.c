/* func_ov004_021d5c98: drive the 0x0500045e backdrop palette with a triangle-
 * wave grayscale from the frame counter (021040ac.2C + 02104f4c, 0..31 fold). */
#include "ov004_core.h"
extern char data_02103fcc[];
extern char data_02104e6c[];
void func_ov004_021d5c98(void) {
    int v = (*(int *)(data_02103fcc + 0x2C) + *(int *)data_02104e6c) & 63;
    if (v >= 32) v = 31 - (v - 32);
    *(volatile unsigned short *)0x0500045E = v | (v << 5) | (v << 10);
}
