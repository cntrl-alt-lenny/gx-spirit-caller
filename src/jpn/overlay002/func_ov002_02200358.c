/* func_ov002_02200358: gate on func_ov002_021ff1d8's result vs the
 * cf17c counter for self's own player, else fall back to checking the
 * OTHER player's cf178 counter. */
#include "ov002_core.h"

extern int func_ov002_021ff1d8(struct Ov002Self *self, int arg1);

int func_ov002_02200358(struct Ov002Self *self) {
    int result = func_ov002_021ff1d8(self, self->b0);
    int raw = self->b0;
    int bit = raw & 1;
    unsigned int n = *(unsigned int *)((char *)data_ov002_022cf09c + bit * 0x868);
    if (n < (unsigned int)result) {
        return 0;
    }
    if (result != 0) {
        goto success;
    }
    if (*(int *)(data_ov002_022cf098 + ((1 - raw) & 1) * 0x868) == 0) {
        return 0;
    }
success:
    return 1;
}
