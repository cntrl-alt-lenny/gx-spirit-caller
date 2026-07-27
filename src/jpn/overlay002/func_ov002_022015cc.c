/* func_ov002_022015cc: guard chain -- a 6-bit field of *(u16*)(arg0+2) must
 * equal 0x12, then *(int*)(arg0+0x14) must be nonzero, then compare
 * data_ov002_022cd314[0] against bit0 of the same u16.
 * Retry 2: the diagnostic showed my `h & 1` compiles to a plain AND,
 * but orig uses the lsl#31/lsr#31 bitfield-embed-in-compare shape --
 * use Ov002Self's b0 bitfield member instead of manual masking.
 */
#include "ov002_core.h"

int func_ov002_022015cc(void *arg0) {
    struct Ov002Self *self = (struct Ov002Self *)arg0;
    u16 h;
    int field6;

    h = *(u16 *)((char *)arg0 + 2);
    field6 = (unsigned int)(h << 0x14) >> 0x1a;
    if (field6 != 0x12) return 0;
    if (*(int *)((char *)arg0 + 0x14) == 0) return 0;
    return *(int *)data_ov002_022cd314 != self->b0;
}
