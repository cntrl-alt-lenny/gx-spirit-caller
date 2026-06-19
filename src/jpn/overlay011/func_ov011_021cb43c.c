/* func_ov011_021cb43c: 0x120 fade + sound 0x4B3; in view-mode 0 also runs the
 * 9/0x4B1 settle and flags 403c.270 bit-16. */
#include "ov011_core.h"
extern void func_ov000_021af27c(int a);
extern int func_0202c06c(int id);
extern void func_ov000_021adc64(int a, int b);
extern void func_ov000_021adb50(int a);
extern void func_ov000_021adb70(void);
void func_ov011_021cb43c(void) {
    char *s = data_ov011_021d3f5c;
    func_ov000_021af27c(0x120);
    if (*(int *)(data_ov011_021d3f20 + 0x2A0) == 0) {
        func_ov000_021adc64(func_0202c06c(0x4B3), 0);
        func_ov000_021adb50(9);
        func_0202c06c(0x4B1);
        func_ov000_021adb70();
        *(int *)(s + 0x270) |= 0x10000;
    } else {
        func_ov000_021adc64(func_0202c06c(0x4B3), 0);
    }
}
