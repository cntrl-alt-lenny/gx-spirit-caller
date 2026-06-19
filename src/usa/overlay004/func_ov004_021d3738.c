/* func_ov004_021d3738: shut down the sub-engine window — 0208e2f4/0208c884 mask
 * off the BLD regs, play SE 232, flush 021d8cd0, clear 0x04001050, and release
 * the 2211538/2211490 records. */
#include "ov004_core.h"
extern void func_0208e2f4(void *reg, int a, int b);
extern void func_0208c79c(void *reg, int v);
extern int func_0202c06c(int id);
extern void func_ov004_021d86ac(void *tag, int v, int n);
extern void func_0200886c(void);
extern void func_ov004_021d8be4(void *rec);
extern void func_02021b58(void);
extern void func_ov004_021cfac0(void *rec);
extern void func_ov004_021c9eb4(void *rec);
int func_ov004_021d3738(void) {
    func_0208e2f4((void *)0x04001050, 28, -16);
    func_0208c79c((void *)0x0400106C, 0);
    func_ov004_021d86ac(data_ov004_02291388, func_0202c06c(232), 1);
    func_0200886c();
    func_ov004_021d8be4(data_ov004_02291388);
    func_0208c79c((void *)0x0400106C, ~15);
    *(volatile unsigned short *)0x04001050 = 0;
    func_02021b58();
    func_ov004_021cfac0(data_ov004_022112d8);
    func_ov004_021c9eb4(data_ov004_02211230);
    return 1;
}
