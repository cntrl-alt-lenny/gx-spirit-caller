/* func_ov002_021cafa4: reset subsystem 0 (two clears) and zero the ce950 scalar
 * at +2060. */
#include "ov002_core.h"
extern void func_ov002_021ab784(int a);
extern void func_ov002_021ae310(int a);
void func_ov002_021cafa4(void) {
    func_ov002_021ab784(0);
    func_ov002_021ae310(0);
    *(int *)(data_ov002_022ce870 + 2060) = 0;
}
