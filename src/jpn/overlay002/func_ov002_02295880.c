#include "ov002_core.h"

extern int func_ov002_021bbe70(int bit0);
extern int func_ov002_02280594(int bit0, int f0, int c);
extern int *func_ov002_021afa94(void);
extern int func_0202e21c(int id);

int func_ov002_02295880(struct Ov002Self *self) {
    if (func_ov002_021bbe70(self->b0) < 2)
        return 0;
    if (func_ov002_02280594(self->b0, self->f0, 0) < 0)
        goto fail;
    {
        int id = ((struct Ov002Slot *)func_ov002_021afa94())->id;
        return func_0202e21c(id) != 0 && id != self->f0;
    }
fail:
    return 0;
}
