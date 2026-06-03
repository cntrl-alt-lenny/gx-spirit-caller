/* func_ov004_021d3818: shut down the sub-engine window — 0208e2f4/0208c884 mask
 * off the BLD regs, play SE 232, flush 021d8cd0, clear 0x04001050, and release
 * the 2211538/2211490 records. */
#include "ov004_core.h"
extern void func_0208e2f4(void *reg, int a, int b);
extern void func_0208c884(void *reg, int v);
extern int func_0202c0c0(int id);
extern void func_ov004_021d8798(void *tag, int v, int n);
extern void func_02008888(void);
extern void func_ov004_021d8cd0(void *rec);
extern void func_02021bac(void);
extern void func_ov004_021cfba0(void *rec);
extern void func_ov004_021c9f94(void *rec);
int func_ov004_021d3818(void) {
    func_0208e2f4((void *)0x04001050, 28, -16);
    func_0208c884((void *)0x0400106C, 0);
    func_ov004_021d8798(data_ov004_022915e8, func_0202c0c0(232), 1);
    func_02008888();
    func_ov004_021d8cd0(data_ov004_022915e8);
    func_0208c884((void *)0x0400106C, ~15);
    *(volatile unsigned short *)0x04001050 = 0;
    func_02021bac();
    func_ov004_021cfba0(data_ov004_02211538);
    func_ov004_021c9f94(data_ov004_02211490);
    return 1;
}
