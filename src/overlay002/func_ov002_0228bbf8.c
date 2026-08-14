/* func_ov002_0228bbf8: gate on func_ov002_02286978(self) then
 * func_ov002_021bbf50(!self->b0); resolve two out-params via
 * func_ov002_02280a1c (once with !self->b0, once with self->b0) and
 * compare them.
 */
#include "ov002_core.h"

extern int func_ov002_02286978(struct Ov002Self *self);
extern int func_ov002_021bbf50(int a);
extern void func_ov002_02280a1c(int bit, int *out1, int *out2, int flag);

int func_ov002_0228bbf8(struct Ov002Self *self) {
    int local1, local2, local0;

    if (func_ov002_02286978(self) == 0)
        goto fail;
    if (func_ov002_021bbf50(1 - self->b0) == 0)
        goto fail;

    func_ov002_02280a1c(1 - self->b0, &local1, &local0, 1);
    func_ov002_02280a1c(self->b0, &local2, &local0, 1);

    if (local1 >= local2)
        return 1;
fail:
    return 0;
}
