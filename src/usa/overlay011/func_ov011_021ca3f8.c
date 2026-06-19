/* func_ov011_021ca3f8: fetch a point via 02006110, bias it by the view origin
 * (238/23C >> 12), and return the low nibble of 021ca400's classification. */
#include "ov011_core.h"
extern void func_020060f4(int *x, int *y);
extern int func_ov011_021ca320(int x, int y);
int func_ov011_021ca3f8(void) {
    int x, y;
    func_020060f4(&x, &y);
    x += *(int *)(data_ov011_021d3f20 + 0x238) >> 12;
    y += *(int *)(data_ov011_021d3f20 + 0x23C) >> 12;
    return func_ov011_021ca320(x, y) & 0xF;
}
