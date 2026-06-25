/* CAMPAIGN-PREP candidate for func_02216f3c (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     per-player 0x868+Ov002Slot.id guard; asymmetric shifts as raw (w>>k)&m; reload w for 2nd call
 *   risk:       021d8904 receives r0=bit9/r1=field as STALE leftovers (orig never reloads them before the bl); if mwcc reorders the id/field/low9 evaluation those regs differ. Also 021de598 r3=(w<<22) is a leftover, arity guessed. struct-guessed.
 *   confidence: low
 */
/* func_ov002_02216f3c: decode packed word *(self+0x14): bit9 (player&1) + 4-bit
 * field[13:10] index a per-player Ov002Slot; if id!=0, call 021d8904(bit9,field,
 * low9,id) then 021de598(self,bit9,field,...). ret 0. */
#include "ov002_core.h"
extern void func_ov002_021d8904(int a, int b, int c, int d);
extern void func_ov002_021de598(struct Ov002Self *self, int a, int b, int c);

int func_ov002_02216f3c(struct Ov002Self *arg0) {
    unsigned int w = *(unsigned int *)((char *)arg0 + 0x14);
    int player = (w >> 9) & 1;
    int field = (w >> 10) & 0xf;
    struct Ov002Slot *s = (struct Ov002Slot *)(data_ov002_022cf16c + player * 0x868 + field * 20 + 0x30);
    if (s->id != 0) {
        unsigned int w2;
        func_ov002_021d8904(player, field, w & 0x1ff, s->id);
        w2 = *(unsigned int *)((char *)arg0 + 0x14);
        func_ov002_021de598(arg0, (w2 >> 9) & 1, (w2 >> 10) & 0xf, (int)(w2 << 22));
    }
    return 0;
}
