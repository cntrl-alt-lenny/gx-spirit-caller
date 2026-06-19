#include "ov008_core.h"
extern void func_ov008_021b19b4(int);
void func_ov008_021b1dd0(void) {
    int *o = *(int **)data_ov008_021b25ec;
    if (o[23] == 0) return;    /* +0x5c */
    if (o[26] != 0) return;    /* +0x68 */
    func_ov008_021b19b4(1);
}
