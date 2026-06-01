/* func_ov002_0220a2e0: only when the cf016c global's +0xCF8 slot is 2, report
 * 021b359c(opponent, 0x1318) clear. */
#include "ov002_core.h"

extern char data_ov002_022d016c[];
extern int func_ov002_021b359c(int player, int code);

int func_ov002_0220a2e0(struct Ov002Self *self) {
    if (*(int *)(data_ov002_022d016c + 0xCF8) != 2)
        return 0;
    return func_ov002_021b359c(1 - self->b0, 0x1318) == 0;
}
