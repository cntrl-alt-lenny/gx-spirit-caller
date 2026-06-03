#include "ov008_core.h"
extern void func_ov008_021b1e20(int, int);
extern int func_ov008_021b1ee0(void);
extern void func_ov008_021b1ef4(void);
extern void func_ov008_021b1f28(void);
void func_ov008_021b2028(int a0) {
    int *o = *(int **)data_ov008_021b270c;
    func_ov008_021b1e20(o[4], 0);   /* +0x10 */
    if (func_ov008_021b1ee0() != 0 && a0 != 0) {
        func_ov008_021b1ef4();
    }
    func_ov008_021b1f28();
}
