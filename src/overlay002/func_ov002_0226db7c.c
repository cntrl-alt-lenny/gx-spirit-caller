/* func_ov002_0226db7c: 0 unless query 0x15a3 holds (func_ov002_021c3ae4); then
 * delegate to func_ov002_0226daec. */
#include "ov002_core.h"
extern int func_ov002_021c3ae4(void *a, int b);
extern int func_ov002_0226daec(void *a, int b);
int func_ov002_0226db7c(void *arg0, int arg1) {
    if (func_ov002_021c3ae4(arg0, 0x15a3) == 0) return 0;
    return func_ov002_0226daec(arg0, arg1);
}
