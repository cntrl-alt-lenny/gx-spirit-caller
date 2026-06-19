/* func_ov004_021cbea4: lay out the b500.9C panel (021ca0a4, slot 1 if active) +
 * the 50x10 frame (021cb778); draw the 36/3 caption (021cb568) when unk90<0.
 * Sibling of 021da898. */
#include "ov004_core.h"
extern void func_ov004_021c9fc4(int a, int b, int c, int d, int e, int f);
extern void func_ov004_021cb698(int a, int b, int c, int d, int e);
extern void func_ov004_021cb488(int a, int b, int c, int d);
void func_ov004_021cbea4(void) {
    func_ov004_021c9fc4((int)data_ov004_02211230, 2, 36, 3, 2,
                        ((*(int *)(data_ov004_0220b2a0 + 0x9C) > 0) ? 1 : 0) + 9);
    func_ov004_021cb698(50, 10, 0, 3, 128);
    if (*(int *)(data_ov004_0220b2a0 + 0x90) >= 0) return;
    func_ov004_021cb488(36, 3, 157, 26);
}
