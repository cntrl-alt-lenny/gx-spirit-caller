/* CAMPAIGN-PREP candidate for func_02291f00 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     D: single bit0 read held (ip); (1-bit)/(bit) mul-index; reuse 0x868 base const as compare limit via sub
 *   risk:       reshape-able: the >0x5dc limit must be expressed as 0x868-0x28c (NOT a folded 0x5dc literal) so mwcc reuses the held 0x868 const (sub r0,r0,#0x28c) instead of a fresh pool load. If it still loads 0x5dc separately, that is the one diverging instruction.
 *   confidence: med
 */
/* func_ov002_02291f00 (ov002, class D, MED). dual mul-table index + bitfield compares, leaf.
 * a = *(int*)(cf16c + (1 - self->f2.bit0)*0x868);  if (a <= 0x1f4) return 1;
 * b = *(int*)(cf16c + (self->f2.bit0 & 1)*0x868);   return b > (0x868 - 0x28c);  (>0x5dc)
 * NOTE self->f2.bit0 read once into ip; (1-ip) used for first index, (ip&1) for second.
 * 0x868 is held in r0 and reused as the >0x5dc literal via sub r0,r0,#0x28c. */
typedef unsigned short u16;
struct F2 { u16 bit0 : 1; u16 rest : 15; };
struct Self { u16 pad0; struct F2 f2; };
extern char data_ov002_022cf16c[];

int func_ov002_02291f00(struct Self *self) {
    int bit = self->f2.bit0;
    if (*(int *)(data_ov002_022cf16c + ((1 - bit) & 1) * 0x868) <= 0x1f4)
        return 1;
    return *(int *)(data_ov002_022cf16c + (bit & 1) * 0x868) > (0x868 - 0x28c);
}
