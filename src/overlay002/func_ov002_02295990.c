#include "ov002_core.h"

extern int func_ov002_021bbf50(int bit0);
extern int func_ov002_022806a4(int bit0, int f0, int c);
extern int *func_ov002_021afb74(void);
extern int func_0202e270(int id);

int func_ov002_02295990(struct Ov002Self *self) {
    if (func_ov002_021bbf50(self->b0) < 2)
        return 0;
    if (func_ov002_022806a4(self->b0, self->f0, 0) < 0)
        goto fail;
    {
        int id = ((struct Ov002Slot *)func_ov002_021afb74())->id;
        return func_0202e270(id) != 0 && id != self->f0;
    }
fail:
    return 0;
}
