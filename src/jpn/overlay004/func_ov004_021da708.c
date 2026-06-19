/* func_ov004_021da708: toggle the e500.C90 page flag (mirrored to b500.3C90);
 * on enable also clear the b500.74/7C/78 cursors. Tail-calls the 02037208 toast. */
#include "ov004_core.h"
extern void func_020371b8(int a, int b, int c, int d);
void func_ov004_021da708(void) {
    char *b = data_ov004_0220b2a0;
    if (*(int *)(data_ov004_0220e2a0 + 0xC90) != 0) {
        *(int *)(b + 0x3C90) = 0;
    } else {
        *(int *)(b + 0x3C90) = 1;
        *(int *)(b + 0x74) = 0;
        *(int *)(b + 0x7C) = 0;
        *(int *)(b + 0x78) = 0;
    }
    func_020371b8(58, -1, 0, 1);
}
