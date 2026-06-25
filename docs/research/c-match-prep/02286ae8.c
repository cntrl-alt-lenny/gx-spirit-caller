/* CAMPAIGN-PREP candidate for func_02286ae8 (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     reuse opp=1-b0 as both (opp&1) base-select and call arg0; b0 re-read in-loop
 *   risk:       reshape-able: orig re-reads self->b0 (ldrh) inside the loop and keeps cf16c in r4, 0x868 in r8, slot-byte-offset in r6 (+=0x14), counter r5; if mwcc hoists `1-b0` out of the loop the in-loop ldrh/rsb disappears and diverges.
 *   confidence: med
 */
/* func_ov002_02286ae8 (ov002, class C) — simple counted loop, mla base index.
 * Guard on self->b0; then scan opponent (1-b0) slots 5..9; for each non-empty, flagged
 * slot, return 1 if the predicate passes. */
typedef unsigned short u16;
typedef unsigned int   u32;

struct Self86ae8 { u16 f0; u16 b0 : 1; u16 rest : 15; };
struct Slot86ae8 { u32 id : 13; char pad[2]; u16 f8; char pad2[8]; }; /* 0x14, f8 at +0x38-0x30=8 */

extern char data_ov002_022cf16c[];
extern int  func_ov002_021c2624(int opp, int i);
extern int  func_ov002_02257ab8(struct Self86ae8 *self, int b0);

int func_ov002_02286ae8(struct Self86ae8 *self) {
    int i;
    if (func_ov002_02257ab8(self, self->b0) == 0) return 0;
    for (i = 5; i < 10; i++) {
        int opp = 1 - self->b0;
        struct Slot86ae8 *s =
            (struct Slot86ae8 *)(data_ov002_022cf16c + (opp & 1) * 0x868 + 0x30 + i * 0x14);
        if (s->id != 0 && s->f8 != 0) {
            if (func_ov002_021c2624(opp, i) != 0) return 1;
        }
    }
    return 0;
}
