/* func_ov002_0226da8c: 0 unless query 0x15a3 holds (func_ov002_021c3a04); then
 * delegate to func_ov002_0226d9fc. */
#include "ov002_core.h"
extern int func_ov002_021c3a04(void *a, int b);
extern int func_ov002_0226d9fc(void *a, int b);
int func_ov002_0226da8c(void *arg0, int arg1) {
    if (func_ov002_021c3a04(arg0, 0x15a3) == 0) return 0;
    return func_ov002_0226d9fc(arg0, arg1);
}
