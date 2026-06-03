/* func_ov004_021da898: lay out the b500.9C panel (021ca0a4) + the 50x10 frame
 * (021da100); when unk90 is unset (<0) also draw the 36/3 caption (021d9ef0). */
#include "ov004_core.h"
extern void func_ov004_021ca0a4(int a, int b, int c, int d, int e, int f);
extern void func_ov004_021da100(int a, int b, int c, int d, int e);
extern void func_ov004_021d9ef0(int a, int b, int c, int d);
void func_ov004_021da898(void) {
    char *b = data_ov004_0220b500;
    func_ov004_021ca0a4((int)data_ov004_02211490, 2, 36, 3, 2, *(int *)(b + 0x9C) + 9);
    func_ov004_021da100(50, 10, 0, 3, 128);
    if (*(int *)(b + 0x90) >= 0) return;
    func_ov004_021d9ef0(36, 3, 157, 26);
}
