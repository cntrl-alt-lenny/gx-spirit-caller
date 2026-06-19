/* func_ov011_021cb154: feed 021ca6c4 a mode from 021cada4(0) when either the
 * 9dd8/cc374 predicate holds or the 403c.280 bit-9 flag is set, else 0. */
#include "ov011_core.h"
extern int func_ov011_021c9cf8(void);
extern int func_ov011_021cc2b0(void);
extern int func_ov011_021cace0(int);
extern void func_ov011_021ca5e4(int);
void func_ov011_021cb154(void) {
    char *s = data_ov011_021d3f5c;
    int v = 0;
    if ((func_ov011_021c9cf8() != 0 && func_ov011_021cc2b0() == 0)
        || (v = (int)((unsigned int)(*(int *)(s + 0x280) << 22) >> 31)) != 0) {
        v = func_ov011_021cace0(0);
    }
    func_ov011_021ca5e4(v);
}
