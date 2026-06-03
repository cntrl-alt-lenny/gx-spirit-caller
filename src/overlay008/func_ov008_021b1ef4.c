#include "ov008_core.h"
extern void func_ov008_021b1ad8(int);
void func_ov008_021b1ef4(void) {
    int *o = *(int **)data_ov008_021b270c;
    if (o[23] == 0) return;    /* +0x5c */
    if (o[26] != 0) return;    /* +0x68 */
    func_ov008_021b1ad8(1);
}
