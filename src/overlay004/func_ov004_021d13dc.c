/* func_ov004_021d13dc: send status 15 (0201cd1c) and, while in phase 15
 * (b500.54), run the open/closed panel handler (021d0f98/021d1118); pop the
 * 02037208 toast. */
#include "ov004_core.h"
extern void func_0201cd1c(int a, void *buf, int n);
extern void func_ov004_021d1118(int a);
extern void func_ov004_021d0f98(int a);
extern void func_02037208(int a, int b, int c, int d);
void func_ov004_021d13dc(void) {
    unsigned short buf[2];
    buf[0] = 15;
    buf[1] = 0;
    func_0201cd1c(6, buf, 4);
    if (*(int *)(data_ov004_0220b500 + 0x54) == 15) {
        if (*(int *)(data_ov004_0220b500 + 0x44) == 0) func_ov004_021d1118(0);
        else func_ov004_021d0f98(0);
    }
    func_02037208(66, -1, 0, 1);
}
