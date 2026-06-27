/* CAMPAIGN-PREP candidate for func_021ed354 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     D: u2 sub-fields as :1/:6/:1 bitfields; bit15 tail-call; mid6==0x23; func-ptr + -1 args
 *   risk:       three extracts of self->u2 (bit15, bits[11:6], bit0) — orig re-derives r3 via lsl;lsr each; if mwcc caches one masked u2 temp the per-field shift widths diverge. reshape-able (bitfield struct) + struct-guessed bit positions.
 *   confidence: low
 */
/* CAMPAIGN-PREP candidate for func_021ed354 (ov002, class D, MED tier) — brief 498.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     CLASS D: self->u2 read once; bit15 -> tail func_021e96a0; bits[11:6]==0x23 ->1; bit0 != player ->0; func ptr (021e96a0) + -1 (mvn) as call args
 *   risk:       three sub-field extracts of one u16 (bit15 :1, mid6 :6 at offset6, bit0 :1) all from self->u2 — orig reloads r3 each time via lsl;lsr; if mwcc shares one masked temp the shift count differs. Plus func_021e96a0 passed as int ptr arg (_LIT1). reshape-able (bitfield struct on u2) + struct-guessed.
 *   confidence: low
 */
typedef unsigned short u16;
typedef unsigned int   u32;

struct Obj02 {
    u16 f0;
    u16 b0    : 1;   /* bit0 */
    u16 mid   : 5;   /* bits[5:1] (skipped) */
    u16 mid6  : 6;   /* bits[11:6] */
    u16 hi3   : 3;   /* bits[14:12] */
    u16 b15   : 1;   /* bit15 */
};

extern int func_ov002_021ba104(int player, int index, int arg2);
extern int func_ov002_021c23ac(int player, int index);
extern int func_ov002_021e96a0(void *self, int player, int index);
extern int func_ov002_02257888(void *self, void *fn, int arg2);

int func_ov002_021ed354(struct Obj02 *self, int player, int index)
{
    if (self->b15)
        return func_ov002_021e96a0(self, player, index);
    if (self->mid6 == 0x23)
        return 1;
    if (player != self->b0)
        return 0;
    if (index >= 5)
        return 0;
    if (func_ov002_021ba104(player, index, 0x1686) == 0)
        return 0;
    if (func_ov002_021c23ac(player, index) == 0)
        return 0;
    if (func_ov002_02257888(self, (void *)func_ov002_021e96a0, -1) != 0)
        return 1;
    return 0;
}
