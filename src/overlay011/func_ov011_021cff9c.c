/* func_ov011_021cff9c: stash arg0's low nibble into 4000.2B4, run the
 * 021cf2b8/021ca67c settle pair, then set the 2B0 blend to 0x28000. */
#include "ov011_core.h"
extern void func_ov011_021cf2b8(void);
extern void func_ov011_021ca67c(void);
void func_ov011_021cff9c(int arg0) {
    *(int *)(data_ov011_021d4000 + 0x2B4) = (*(int *)(data_ov011_021d4000 + 0x2B4) & ~0xF) | (arg0 & 0xF);
    func_ov011_021cf2b8();
    func_ov011_021ca67c();
    *(int *)(data_ov011_021d4000 + 0x2B0) = (*(int *)(data_ov011_021d4000 + 0x2B0) & 0xFFE01FFF) | 0x28000;
}
