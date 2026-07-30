/* func_ov002_021ff7d8: guard on self's +2 bitfield "kind" field (==0xd),
 * then a 4-arg gate call, then a 3-way field-vs-bit compare against
 * data_ov002_022cd3f4 before dispatching to func_ov002_021c1ef0. */
#include "ov002_core.h"

typedef struct {
    char _pad0[2];
    u16 player : 1;
    u16 f1_5 : 5;
    u16 kind : 6;
    u16 _pad2 : 4;
} Self7d8;

extern int func_ov002_021b4054(int a, int b, int c, int d);

int func_ov002_021ff7d8(struct Ov002Self *self) {
    Self7d8 *b = (Self7d8 *)self;
    if (b->kind != 0xd)
        return 0;
    if (func_ov002_021b4054(b->player, b->f1_5, 0x1119, 3) != 0)
        return 0;
    {
        int f0 = *(int *)(data_ov002_022cd3f4 + 0);
        if (f0 == 1 - b->player
            && *(int *)(data_ov002_022cd3f4 + 4) == b->player
            && *(int *)(data_ov002_022cd3f4 + 0x20) == b->f1_5) {
            if (func_ov002_021c1ef0(self, f0, *(int *)(data_ov002_022cd3f4 + 0x1c)) != 0)
                return 1;
        }
    }
    return 0;
}
