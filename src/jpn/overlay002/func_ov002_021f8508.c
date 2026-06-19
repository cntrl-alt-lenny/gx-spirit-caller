/* func_ov002_021f8508: when the pending flag (ce288+1460) is clear, run the
 * default handler (021f4a4c) first, then forward to func_ov002_021faa84. */
#include "ov002_core.h"
extern void func_ov002_021f495c(void *a);
extern int func_ov002_021faa84(void *a, int b);
int func_ov002_021f8508(void *arg0, int arg1) {
    if (*(int *)(data_ov002_022ce1a8 + 1460) == 0)
        func_ov002_021f495c(arg0);
    return func_ov002_021faa84(arg0, arg1);
}
