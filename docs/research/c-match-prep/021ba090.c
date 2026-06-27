/* CAMPAIGN-PREP candidate for func_021ba090 (ov006, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     do-while bit-accumulate; bind self+0xa0 base advanced in loop; mode-conditional byte store
 *   risk:       reshape-able: the streqb/streqb/strneb chain ('==5 store-skip, ==6 store-skip, else store') maps to if/else-if/else; if cmp-chain order differs, nest the ifs. Loop guard wants <<31>>31 not '&1'.
 *   confidence: med
 */
/* func_ov006_021ba090 — scan 5 elements (stride 0x24) at self+0xa0, accumulate
 * bit0 of each element's +0x20 word into a mask, then store the mask byte into
 * data_02104f54 at a per-mode slot (mode 5 ->[1], 6 ->[2], else ->[0]). ret 1. */
typedef unsigned char u8;
extern u8 data_02104f54[];

typedef struct {
    char _pad0[0x40];
    int  mode;           /* 0x40 */
    char _pad44[0x5c];
    struct { char _p[0x20]; unsigned f20; } elem[5]; /* 0xa0, stride 0x24 */
} Ov006ScanS;

int func_ov006_021ba090(Ov006ScanS *self) {
    unsigned mask = 0;
    int i = 0;
    do {
        if ((self->elem[i].f20 << 31) >> 31)
            mask |= 1 << i;
    } while (++i < 5);
    if (self->mode == 5)
        data_02104f54[1] = (u8)mask;
    else if (self->mode == 6)
        data_02104f54[2] = (u8)mask;
    else
        data_02104f54[0] = (u8)mask;
    return 1;
}
