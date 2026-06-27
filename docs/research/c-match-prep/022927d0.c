/* CAMPAIGN-PREP candidate for func_022927d0 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     bind flag0*0x868 once (CSE) across two char[] banks; &0x1fff mask
 *   risk:       Shared index multiply flag0*0x868 reused for both banks (r3). If mwcc does not CSE it, a duplicate mul diverges. reshape-able (explicit idx temp, as written)
 *   confidence: med
 */
/* func_ov002_022927d0 (ov002, D) - field13 test + parallel-table guard (no leading guard).
 * flag0 = bit0 ushort@+2.  idx = flag0*0x868 (computed once, reused for both tables).
 * w = *(int*)(data_022cf16c + idx + 0xf8); f13 = w & 0x1fff (lsl#19;lsr#19).
 * h = *(unsigned short*)(data_022cf26c + idx).
 * return (f13 != 0 && h != 0) ? 0 : 1. */
extern char data_ov002_022cf16c[];
extern char data_ov002_022cf26c[];
struct Obj { unsigned short u0; unsigned short flag0 : 1, : 15; };

int func_ov002_022927d0(struct Obj *card) {
    int idx = card->flag0 * 0x868;
    if ((*(int *)(data_ov002_022cf16c + idx + 0xf8) & 0x1fff) != 0
        && *(unsigned short *)(data_ov002_022cf26c + idx) != 0)
        return 0;
    return 1;
}
