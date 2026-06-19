/* func_ov002_02207f14: 0 unless active (func_ov002_02208e10); then 1 iff the
 * scored metric (func_ov002_021c83c8 of cd3f4+4/+32) reaches 2000. */
#include "ov002_core.h"
extern int func_ov002_02208e10(void);
extern int func_ov002_021c83c8(int a, int b);
int func_ov002_02207f14(void) {
    if (func_ov002_02208e10() == 0) return 0;
    return func_ov002_021c83c8(*(int *)(data_ov002_022cd314 + 4), *(int *)(data_ov002_022cd314 + 32)) >= 2000;
}
