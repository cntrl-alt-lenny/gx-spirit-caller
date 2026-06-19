/* func_ov004_021d95b4: clear b500.224 and broadcast a 2-halfword status packet
 * (3, b500.22C) via 02034888, then the 02037208 toast. Sibling of 021ceb24. */
#include "ov004_core.h"
extern void func_02034838(int a, void *buf, int n);
extern void func_020371b8(int a, int b, int c, int d);
void func_ov004_021d95b4(void) {
    char *b = data_ov004_0220b2a0;
    unsigned short buf[2];
    *(int *)(b + 0x224) = 0;
    buf[0] = 3;
    buf[1] = *(int *)(b + 0x22C);
    func_02034838(3, buf, 4);
    func_020371b8(66, -1, 0, 1);
}
