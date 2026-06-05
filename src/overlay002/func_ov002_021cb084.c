/* func_ov002_021cb084: reset subsystem 0 (two clears) and zero the ce950 scalar
 * at +2060. */
#include "ov002_core.h"
extern void func_ov002_021ab864(int a);
extern void func_ov002_021ae3f0(int a);
void func_ov002_021cb084(void) {
    func_ov002_021ab864(0);
    func_ov002_021ae3f0(0);
    *(int *)(data_ov002_022ce950 + 2060) = 0;
}
