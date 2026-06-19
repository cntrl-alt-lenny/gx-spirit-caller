#include "ov008_core.h"
extern void func_ov008_021b1cfc(int, int);
extern int func_ov008_021b1dbc(void);
extern void func_ov008_021b1dd0(void);
extern void func_ov008_021b1e04(void);
void func_ov008_021b1f04(int a0) {
    int *o = *(int **)data_ov008_021b25ec;
    func_ov008_021b1cfc(o[4], 0);   /* +0x10 */
    if (func_ov008_021b1dbc() != 0 && a0 != 0) {
        func_ov008_021b1dd0();
    }
    func_ov008_021b1e04();
}
