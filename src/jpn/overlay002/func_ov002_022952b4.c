/* func_ov002_022952b4: post command (1 - self.player, 11, 0x12a1). Tail-call. */
#include "ov002_core.h"
extern int func_ov002_021b3dec(int a, int b, int c);
int func_ov002_022952b4(struct Ov002Self *self) {
    return func_ov002_021b3dec(1 - self->b0, 11, 0x12a1);
}
