#include "ov008_core.h"
extern void func_0201ef3c(int, void *, void *);
void func_ov008_021ab120(int *o) {
    int i;
    for (i = 0; i < 2; i++) {
        if (o[14]) {                              /* +0x38 */
            func_0201ef3c(o[0], &o[2], &o[14]);   /* +0, +8, +0x38 */
            o[15] = 0;                            /* +0x3c */
            o[14] = 0;
        }
    }
}
