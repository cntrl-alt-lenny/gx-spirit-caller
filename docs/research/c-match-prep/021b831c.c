/* CAMPAIGN-PREP candidate for func_021b831c (ov006, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     switch Copy32; flag-predicated dst base; tail flag-select u16 then store
 *   risk:       orig keeps dst/src in r0/r1 via interleaved addne/addeq (predicated, no branch); if mwcc emits cmp;branch for the if/else instead of movcc-style predication the per-case block shape diverges (reshape-able toward predication, else permuter-class).
 *   confidence: med
 */
/* CAMPAIGN-PREP candidate for func_ov006_021b831c (ov006, class C/D) — MED tier.
 * UNVERIFIED build-free draft.
 *   recipe: switch(sel) of Copy32; per-case flag picks dst base (predicated add), src base flag-independent; tail: flag picks u16 src offset, store to p+sel*2+0xc662.
 * Decl order: sel(r5) then p(r6) then flag(r4) per asm mov sequence. Copy32(dst,src,n). */

extern void Copy32(void *dst, void *src, int n);

int func_ov006_021b831c(char *p, int sel, int flag) {
    char *dst;
    char *src;
    unsigned short v;
    switch (sel) {
    case 0:
        if (flag) dst = p + 0x1d8 + 0x8000; else dst = p + 0x2a0 + 0x6000;
        src = p + 0x198 + 0x9800;
        Copy32(dst, src, 0x17c0);
        break;
    case 1:
        if (flag) dst = p + 0x158 + 0xb000; else dst = p + 0xa60 + 0x7000;
        src = p + 0x358 + 0xb000;
        Copy32(dst, src, 0x200);
        break;
    case 2:
        if (flag) dst = p + 0x358 + 0xb400; else dst = p + 0xc60 + 0x7000;
        src = p + 0x158 + 0xb800;
        Copy32(dst, src, 0x200);
        break;
    case 3:
        if (flag) dst = p + 0x158 + 0xbc00; else dst = p + 0xe60 + 0x7000;
        src = p + 0x358 + 0xbc00;
        Copy32(dst, src, 0x200);
        break;
    case 4:
        if (flag) dst = p + 0x358 + 0xc000; else dst = p + 0x60 + 0x8000;
        src = p + 0x58 + 0xc400;
        Copy32(dst, src, 0x100);
        break;
    }
    if (flag) v = *(unsigned short *)(p + sel * 2 + 0xc600 + 0x58);
    else      v = *(unsigned short *)(p + sel * 2 + 0x8100 + 0x60);
    *(unsigned short *)(p + sel * 2 + 0xc600 + 0x62) = v;
    return 1;
}
