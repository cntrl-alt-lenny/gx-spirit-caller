/* func_ov002_0228bae8: gate on func_ov002_02286868(self) then
 * func_ov002_021bbe70(!self->b0); resolve two out-params via
 * func_ov002_0228090c (once with !self->b0, once with self->b0) and
 * compare them.
 */
#include "ov002_core.h"

extern int func_ov002_02286868(struct Ov002Self *self);
extern int func_ov002_021bbe70(int a);
extern void func_ov002_0228090c(int bit, int *out1, int *out2, int flag);

int func_ov002_0228bae8(struct Ov002Self *self) {
    int local1, local2, local0;

    if (func_ov002_02286868(self) == 0)
        goto fail;
    if (func_ov002_021bbe70(1 - self->b0) == 0)
        goto fail;

    func_ov002_0228090c(1 - self->b0, &local1, &local0, 1);
    func_ov002_0228090c(self->b0, &local2, &local0, 1);

    if (local1 >= local2)
        return 1;
fail:
    return 0;
}
