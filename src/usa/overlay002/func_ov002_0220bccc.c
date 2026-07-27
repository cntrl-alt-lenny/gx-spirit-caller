/* func_ov002_0220bccc: guard chain -- a 6-bit field of *(u16*)(arg0+2)
 * must be 0x12, CD3F4->f_8 must be 0, CD3F4->f_4 must equal bit0 of the
 * same u16 -- then tail func_ov002_021ba024(CD3F4->f_4, CD3F4->f_20,
 * 0x18a8) and return whether it's nonzero.
 * Retry 2: diagnostic confirmed the only 2 diffs (90.91% match) were
 * `h&1` compiling to AND where orig uses the lsl#31/lsr#31 compare-embed
 * shape -- use Ov002Self's b0 bitfield member instead.
 */
#include "ov002_core.h"

extern int func_ov002_021ba024(int a, int b, int c);

int func_ov002_0220bccc(void *arg0) {
    struct Ov002Self *self = (struct Ov002Self *)arg0;
    u16 h;
    int field6;
    int v;

    h = *(u16 *)((char *)arg0 + 2);
    field6 = (unsigned int)(h << 0x14) >> 0x1a;
    if (field6 == 0x12
        && *(int *)(data_ov002_022cd314 + 0x8) == 0
        && *(int *)(data_ov002_022cd314 + 0x4) == self->b0) {
        v = func_ov002_021ba024(*(int *)(data_ov002_022cd314 + 0x4),
                                 *(int *)(data_ov002_022cd314 + 0x20), 0x18a8);
        if (v != 0) return 1;
    }
    return 0;
}
