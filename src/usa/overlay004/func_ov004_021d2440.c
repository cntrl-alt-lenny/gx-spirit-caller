/* func_ov004_021d2440: init the 2211490/2211538 records (021cfba0 + the
 * 021c9f94 handle-reset) and reset slot 0; returns 1. */
#include "ov004_core.h"
extern void func_02021b58(void);
extern void func_ov004_021cfac0(void *p);
extern void func_ov004_021c9eb4(void *rec);
extern void func_ov004_021d0514(int x);
int func_ov004_021d2440(void) {
    func_02021b58();
    func_ov004_021cfac0(data_ov004_022112d8);
    func_ov004_021c9eb4(data_ov004_02211230);
    func_ov004_021d0514(0);
    return 1;
}
