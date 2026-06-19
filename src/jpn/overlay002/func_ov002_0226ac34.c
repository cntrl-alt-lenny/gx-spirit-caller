/* func_ov002_0226ac34: latch a queued command (kind/payload), copy up-to-8 coord
 * words into d0f0c, and run the dispatcher. */
#include "ov002_core.h"
extern char data_ov002_022d0e2c[];
extern void func_ov002_0229cc60(void *dst, void *src, int n);
extern int func_ov002_0226aba4(void);
int func_ov002_0226ac34(int arg0, int arg1, void *arg2, int arg3) {
    *(int *)(data_ov002_022d008c + 3476) = arg0;
    *(int *)(data_ov002_022d008c + 3480) = arg1;
    if (arg3 > 8) arg3 = 8;
    func_ov002_0229cc60(data_ov002_022d0e2c, arg2, arg3 * 2);
    return func_ov002_0226aba4();
}
