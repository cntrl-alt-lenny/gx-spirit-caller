/* func_ov002_0220581c: gate on cf17c[player]!=0, then unless self's
 * +2 "kind" field (bits6-11) == 0x23, run a guard chain through
 * func_ov002_021ff2c8 / func_ov002_021bbeac / func_ov002_021ca63c. */
#include "ov002_core.h"

typedef struct {
    char _pad0[2];
    u16 player : 1;
    u16 _pad1 : 5;
    u16 kind : 6;
    u16 _pad2 : 4;
} SelfBits;

extern int func_ov002_021ff2c8(struct Ov002Self *self, int player);
extern int func_ov002_021bbeac(int player);
extern int func_ov002_021ca63c(int bit0, int k);

int func_ov002_0220581c(struct Ov002Self *self) {
    SelfBits *b = (SelfBits *)self;
    int idx = b->player & 1;
    if (*(int *)((char *)data_ov002_022cf17c + idx * 0x868) == 0)
        return 0;
    if (b->kind == 0x23)
        goto ret1;
    if (func_ov002_021ff2c8(self, b->player) == 0) {
        if (func_ov002_021bbeac(b->player) == 0)
            goto ret1;
    }
    if (func_ov002_021ca63c(b->player, 1) == 0)
        return 0;
ret1:
    return 1;
}
