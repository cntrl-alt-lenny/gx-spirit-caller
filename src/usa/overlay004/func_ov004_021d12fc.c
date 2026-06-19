/* func_ov004_021d12fc: send status 15 (0201cd1c) and, while in phase 15
 * (b500.54), run the open/closed panel handler (021d0f98/021d1118); pop the
 * 02037208 toast. */
#include "ov004_core.h"
extern void func_0201ccc8(int a, void *buf, int n);
extern void func_ov004_021d1038(int a);
extern void func_ov004_021d0eb8(int a);
extern void func_020371b8(int a, int b, int c, int d);
void func_ov004_021d12fc(void) {
    unsigned short buf[2];
    buf[0] = 15;
    buf[1] = 0;
    func_0201ccc8(6, buf, 4);
    if (*(int *)(data_ov004_0220b2a0 + 0x54) == 15) {
        if (*(int *)(data_ov004_0220b2a0 + 0x44) == 0) func_ov004_021d1038(0);
        else func_ov004_021d0eb8(0);
    }
    func_020371b8(66, -1, 0, 1);
}
