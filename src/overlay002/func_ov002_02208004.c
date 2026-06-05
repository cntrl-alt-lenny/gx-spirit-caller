/* func_ov002_02208004: 0 unless active (func_ov002_02208f00); then 1 iff the
 * scored metric (func_ov002_021c84a8 of cd3f4+4/+32) reaches 2000. */
#include "ov002_core.h"
extern int func_ov002_02208f00(void);
extern int func_ov002_021c84a8(int a, int b);
int func_ov002_02208004(void) {
    if (func_ov002_02208f00() == 0) return 0;
    return func_ov002_021c84a8(*(int *)(data_ov002_022cd3f4 + 4), *(int *)(data_ov002_022cd3f4 + 32)) >= 2000;
}
