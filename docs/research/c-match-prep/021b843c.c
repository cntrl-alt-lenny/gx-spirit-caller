/* CAMPAIGN-PREP candidate for func_021b843c (ov006, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     switch Fill32(0,dst,n); flag-predicated dst base; tail eq-clears two u16
 *   risk:       tail: orig computes base once (add r0,r6,r5,lsl#1) then predicated addne/addeq + strneh/streqh; my if/else recomputes p+sel*2 per branch — mwcc may not CSE it back, diverging the base add (reshape-able: hoist base ptr before the if).
 *   confidence: med
 */
/* CAMPAIGN-PREP candidate for func_ov006_021b843c (ov006, class C/D) — MED tier.
 * UNVERIFIED build-free draft. Sibling of 021b831c but Fill32 (no src) and tail clears 2 fields on eq.
 *   recipe: switch(sel) Fill32(0,dst,n); flag picks dst base; tail flag-select store target, clear u16 (eq clears both 0x60 and 0x6a).
 * Decl order sel(r5),p(r6),flag(r4). Fill32(value,dst,size). */

extern void Fill32(int value, void *dst, int size);

int func_ov006_021b843c(char *p, int sel, int flag) {
    char *dst;
    switch (sel) {
    case 0:
        if (flag) dst = p + 0x1d8 + 0x8000; else dst = p + 0x2a0 + 0x6000;
        Fill32(0, dst, 0x17c0);
        break;
    case 1:
        if (flag) dst = p + 0x158 + 0xb000; else dst = p + 0xa60 + 0x7000;
        Fill32(0, dst, 0x200);
        break;
    case 2:
        if (flag) dst = p + 0x358 + 0xb400; else dst = p + 0xc60 + 0x7000;
        Fill32(0, dst, 0x200);
        break;
    case 3:
        if (flag) dst = p + 0x158 + 0xbc00; else dst = p + 0xe60 + 0x7000;
        Fill32(0, dst, 0x200);
        break;
    case 4:
        if (flag) dst = p + 0x358 + 0xc000; else dst = p + 0x60 + 0x8000;
        Fill32(0, dst, 0x100);
        break;
    }
    if (flag) {
        *(unsigned short *)(p + sel * 2 + 0xc600 + 0x58) = 0;
    } else {
        *(unsigned short *)(p + sel * 2 + 0x8100 + 0x60) = 0;
        *(unsigned short *)(p + sel * 2 + 0x8100 + 0x6a) = 0;
    }
    return 1;
}
