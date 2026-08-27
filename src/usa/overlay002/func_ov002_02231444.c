/* func_ov002_02231444: nested loop (i in 0..1, j in 0..10), gating
 * func_ov002_021d6ba8(self, D016C->f_cec^i, j) on func_ov002_02257564.
 * func_ov002_021e2a4c/021e2c5c bracket the whole scan. */
#include "ov002_core.h"

extern int func_ov002_021d6ba8(void *self, int lo, int hi);
extern int func_ov002_02257564(void *self, int a, int b);

int func_ov002_02231444(void *self) {
    int i;

    func_ov002_021e2a4c();

    for (i = 0; i < 2; i++) {
        int xorval = D016C->f_cec ^ i;
        int j;
        for (j = 0; j <= 10; j++) {
            if (func_ov002_02257564(self, xorval, j) != 0) {
                func_ov002_021d6ba8(self, xorval, j);
            }
        }
    }

    func_ov002_021e2b6c();
    return 0;
}
