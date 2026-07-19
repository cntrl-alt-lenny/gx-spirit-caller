/* Bg_SetScroll: push the view origin (238/23C >> 12, 9-bit each) to the
 * BG scroll regs 0x04000010 (only in view-mode 1) and 0x04000014. */
#include "ov011_core.h"
void Bg_SetScroll(void) {
    int x = *(int *)(data_ov011_021d3f20 + 0x238);
    int y = *(int *)(data_ov011_021d3f20 + 0x23C) >> 12;
    if (*(int *)(data_ov011_021d3f20 + 0x2A0) == 1)
        *(volatile unsigned int *)0x04000010 = ((x >> 12) & 0x1FF) | ((y << 16) & 0x01FF0000);
    *(volatile unsigned int *)0x04000014 = ((x >> 12) & 0x1FF) | ((y << 16) & 0x01FF0000);
}
