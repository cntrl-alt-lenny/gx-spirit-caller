/* CAMPAIGN-PREP candidate for func_021cfd6c (ov004, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     signed /2 via (x+(x>>31))>>1 from plain '/2'; per-iter slot+=0x20, accumulate i*0x200
 *   risk:       permuter-class: the two-word stack marshal before bl then re-load (str/ldr [sp],[sp+4]) plus reg rotation of slot/ybase across the call is scheduling-sensitive; decl-order set first-used but the post-blx copy may rotate.
 *   confidence: low
 */
/* func_ov004_021cfd6c: 6-iter OAM-build loop. a0=base ptr(sl), a1=palette byte, a2=x.
 * Precompute attr0-ish word: ((x*3)<<10)/2 ... -> w = (((x*3)<<10) signed >>1)+0x80 (=r9 base).
 * attr1 hi word r8 = (pal&0xff)|0x4000|0x80000000. Per i: yy = r9 + (i*0x200)/2 (signed),
 * then yy>>6, +carry, >>7 packs; r3 = r8 | ((sl<<23)>>7); r2 = packed | 0x2000.
 * 02005dac(2, i, ...stack) returns dst; copy the two words to dst[0],dst[1]. Class C: signed /2. */
extern int *func_02005dac(int a, int b);

void func_ov004_021cfd6c(int *base, int pal, int x) {
    int slot;
    int i;
    int n3;
    int yfix;
    int hi;
    int ybase;
    int *dst;
    int w0;
    int w1;
    int y;

    n3 = (x * 3) << 10;
    hi = (pal & 0xff) | 0x4000 | (int)0x80000000;
    ybase = (n3 / 2) + 0x80;
    slot = (int)base;
    for (i = 0; i < 6; i++) {
        y = ybase + ((i * 0x200) / 2);
        yfix = ((y >> 6) >> 25) + y;
        w1 = (yfix >> 7) | 0x2000;
        w0 = hi | ((unsigned int)(slot << 23) >> 7);
        dst = func_02005dac(2, i);
        ((int *)dst)[0] = w0;
        ((int *)dst)[1] = w1;
        slot += 0x20;
    }
}
