/* func_ov011_021cb500: 0x120 fade + sound 0x4B3; in view-mode 0 also runs the
 * 9/0x4B1 settle and flags 403c.270 bit-16. */
#include "ov011_core.h"
extern void func_ov000_021af368(int a);
extern int func_0202c0c0(int id);
extern void func_ov000_021add44(int a, int b);
extern void func_ov000_021adc30(int a);
extern void func_ov000_021adc50(void);
void func_ov011_021cb500(void) {
    char *s = data_ov011_021d403c;
    func_ov000_021af368(0x120);
    if (*(int *)(data_ov011_021d4000 + 0x2A0) == 0) {
        func_ov000_021add44(func_0202c0c0(0x4B3), 0);
        func_ov000_021adc30(9);
        func_0202c0c0(0x4B1);
        func_ov000_021adc50();
        *(int *)(s + 0x270) |= 0x10000;
    } else {
        func_ov000_021add44(func_0202c0c0(0x4B3), 0);
    }
}
