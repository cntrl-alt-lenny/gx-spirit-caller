/* func_ov004_021d9778: flag b500.224, broadcast a (4, b500.22C) status packet
 * (02034888), flag b500.234, and pop the 02037208 toast. Message-family
 * sibling of 021ceb24. */
#include "ov004_core.h"
extern void func_02034888(int a, void *buf, int n);
extern void func_02037208(int a, int b, int c, int d);
void func_ov004_021d9778(void) {
    char *b = data_ov004_0220b500;
    unsigned short buf[2];
    *(int *)(b + 0x224) = 1;
    buf[0] = 4;
    buf[1] = *(int *)(b + 0x22C);
    func_02034888(3, buf, 4);
    *(int *)(b + 0x234) = 1;
    func_02037208(58, -1, 0, 1);
}
