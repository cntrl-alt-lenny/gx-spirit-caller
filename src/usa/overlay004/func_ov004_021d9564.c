/* func_ov004_021d9564: flag b500.224, broadcast a (4, b500.22C) status packet
 * (02034888), flag b500.234, and pop the 02037208 toast. Message-family
 * sibling of 021ceb24. */
#include "ov004_core.h"
extern void func_02034838(int a, void *buf, int n);
extern void func_020371b8(int a, int b, int c, int d);
void func_ov004_021d9564(void) {
    char *b = data_ov004_0220b2a0;
    unsigned short buf[2];
    *(int *)(b + 0x224) = 1;
    buf[0] = 4;
    buf[1] = *(int *)(b + 0x22C);
    func_02034838(3, buf, 4);
    *(int *)(b + 0x234) = 1;
    func_020371b8(58, -1, 0, 1);
}
