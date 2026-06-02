/* func_ov004_021d2520: init the 2211490/2211538 records (021cfba0 + the
 * 021c9f94 handle-reset) and reset slot 0; returns 1. */
#include "ov004_core.h"
extern void func_02021bac(void);
extern void func_ov004_021cfba0(void *p);
extern void func_ov004_021c9f94(void *rec);
extern void func_ov004_021d05f4(int x);
int func_ov004_021d2520(void) {
    func_02021bac();
    func_ov004_021cfba0(data_ov004_02211538);
    func_ov004_021c9f94(data_ov004_02211490);
    func_ov004_021d05f4(0);
    return 1;
}
