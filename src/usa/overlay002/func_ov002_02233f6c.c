/* func_ov002_02233f6c: only when d016c+208 has bit0 clear and bit1 set, run
 * func_ov002_02233e88 (arg1 passed through); else 0. */
#include "ov002_core.h"
extern int func_ov002_02233e88(void *a, int b);
int func_ov002_02233f6c(void *arg0, int arg1) {
    unsigned v = *(int *)(data_ov002_022d008c + 208);
    if (v & 1) return 0;
    if (!((v >> 1) & 1)) return 0;
    return func_ov002_02233e88(arg0, arg1);
}
