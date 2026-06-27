/* CAMPAIGN-PREP candidate for func_02292754 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     bind flag0*0x868 once (CSE r3) across two char[] banks; &0x1fff mask
 *   risk:       Shared index multiply: orig computes flag0*0x868 once (mul r3) and reuses for both banks. If mwcc fails to CSE flag0*0x868, a second mul/mla appears. reshape-able (explicit idx temp, as written)
 *   confidence: med
 */
/* func_ov002_02292754 (ov002, D) - leading equality guard + field13 test + 2nd-table guard.
 * if (data_022d016c[0xdc/4] == card->u0) return 0.
 * flag0 = bit0 ushort@+2.  idx = flag0*0x868 (computed ONCE in r3, reused for BOTH tables).
 * w = *(int*)(data_022cf16c + idx + 0xf8); f13 = w & 0x1fff (lsl#19;lsr#19).
 * h = *(unsigned short*)(data_022cf26c + idx).
 * return (f13 != 0 && h != 0) ? 0 : 1.   (cmp;moveq #1/movne #0 = logical-not). */
extern int            data_ov002_022d016c[];
extern char           data_ov002_022cf16c[];
extern char           data_ov002_022cf26c[];
struct Obj { unsigned short u0; unsigned short flag0 : 1, : 15; };

int func_ov002_02292754(struct Obj *card) {
    int idx;
    if (data_ov002_022d016c[0xdc / 4] == card->u0) return 0;
    idx = card->flag0 * 0x868;
    if ((*(int *)(data_ov002_022cf16c + idx + 0xf8) & 0x1fff) != 0
        && *(unsigned short *)(data_ov002_022cf26c + idx) != 0)
        return 0;
    return 1;
}
