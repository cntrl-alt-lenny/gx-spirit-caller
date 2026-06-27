/* CAMPAIGN-PREP candidate for func_022bd1fc (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     D: cmp/beq (not table); if-assign fold-back v=0x10-v; s[cdc]=(v<<8)/8 signed divmod.
 *   risk:       reshape-able: the (v<<8)/8 must stay an explicit signed divide (mwcc emits asr#2/add-sign-bias/asr#3, NOT lsl#5) — if it constant-folds to <<5 it diverges; rewrite as ((v<<8))/8 kept opaque, or split via volatile/temp. Sparse switch must not become a jump-table.
 *   confidence: med
 */
/* CAMPAIGN-PREP candidate for func_022bd1fc (ov002, class D, MED tier).
 * UNVERIFIED + ITERATION-EXPECTED. 3-state cmp/beq machine on s[0xc60] (sparse, NOT
 * a jump table). State 1 computes s[0xcdc] = ((v<<8))/8 SIGNED (round-toward-zero):
 * orig emits the rounding-divide sequence not a plain lsl#5, so the source is /8 of
 * a shifted value. Pre: if(c64>8) c64 = 0x10 - c64 (if-assign / fold-back).
 * Cross-checked vs src/overlay002/func_ov002_022bd1fc.s. */
extern void func_02037208(int, int, int, int);

int func_ov002_022bd1fc(int *s) {
    int v;
    switch (s[0xc60 / 4]) {
    case 0:
        func_02037208(0x33, -1, 0, 1);
        s[0xce0 / 4] = s[0xc58 / 4];
        s[0xcdc / 4] = 0;
        s[0xc60 / 4] = 1;
        s[0xc64 / 4] = 0;
        break;
    case 1:
        v = s[0xc64 / 4];
        if (v > 8)
            v = 0x10 - v;
        s[0xcdc / 4] = (v << 8) / 8;
        if (s[0xc64 / 4] < 0x10)
            break;
        s[0xc60 / 4] = 2;
        s[0xc64 / 4] = 0;
        break;
    case 2:
        s[0xcdc / 4] = 0;
        s[0xcc8 / 4] = 0xc;
        s[0xc54 / 4] = 0;
        return 1;
    default:
        break;
    }
    s[0xc64 / 4]++;
    return 1;
}
