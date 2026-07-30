/* func_ov002_02225698: dispatch on self+0xc kind (1 or 2), test the cf17c
 * per-player table for self->b0 (kind 1) or the other player (kind 2), and
 * notify func_ov002_021e277c if set. Always returns 0. Both kind cases are
 * out-of-line (goto) in the original, with a trailing redundant &1 re-mask
 * after the bitfield shift-extract. */
#include "ov002_core.h"

int func_ov002_02225698(struct Ov002Self *self) {
    unsigned short kind = *(unsigned short *)((char *)self + 0xc);
    unsigned int bit0;

    if (kind == 1) goto case_1;
    if (kind != 2) goto done;
    goto case_2;

case_1:
    bit0 = self->b0;
    if (*(int *)((char *)data_ov002_022cf09c + (bit0 & 1) * 0x868) != 0)
        func_ov002_021e277c(bit0);
    goto done;

case_2:
    bit0 = 1 - self->b0;
    if (*(int *)((char *)data_ov002_022cf09c + (bit0 & 1) * 0x868) != 0)
        func_ov002_021e277c(bit0);

done:
    return 0;
}
