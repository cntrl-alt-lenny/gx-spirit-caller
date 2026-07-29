/* func_ov002_021b359c: for player (self&1), count slots [0,5) whose
 * Ov002Slot.id is nonzero AND whose halfword at slot+8 is nonzero,
 * dispatching each to func_ov002_021b30ac(self, i, arg1). */
#include "ov002_core.h"

extern int func_ov002_021b30ac(int self, int idx, int arg1);

int func_ov002_021b359c(int self, int arg1) {
    int i;
    int count;
    char *slotp;
    char *p;
    p = data_ov002_022cf16c + (self & 1) * 0x868;
    slotp = p + 0x30;
    count = 0;
    for (i = 0; i < 5; i++) {
        if (((struct Ov002Slot *)slotp)->id != 0) {
            if (*(unsigned short *)(p + 0x38) != 0) {
                if (func_ov002_021b30ac(self, i, arg1) != 0) {
                    count++;
                }
            }
        }
        slotp += 0x14;
        p += 0x14;
    }
    return count;
}
