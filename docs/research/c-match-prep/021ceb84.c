/* CAMPAIGN-PREP candidate for func_021ceb84 (ov003, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     if-assign ternaries hoisted; decl which/tilebase/y first; &rec held
 *   risk:       permuter-class: two hoisted ternaries (r8=a1?1:2, r9=a2?0x10:0x8) interleave with `and #0xff`+two `orr` for r7 base — already brief-302 reg-alloc wall, C won't steer the movne/moveq scheduling.
 *   confidence: low
 */
/* func_ov003_021ceb84 (ov003, class C): 4-iter OAM-attr builder.
 * which = a1?1:2 ; tilebase = a2?0x10:0x8 (+=2/iter) ;
 * y = (a2*0x18 + 0x94) & 0xff ; attr01 = y|0x4000|0x80000000|((x&0x1ff)<<16)
 * where x = (a4 + 0x14) per iter, a4 += 0x20 ; attr2 = tilebase|0x400|(a3<<12).
 * Build 6-byte rec on stack, get slot from func_02005dac(which,i), copy via
 * func_020944a4(&rec, slot, 6).  NOTE: already ships as .s (brief 302 wall). */
extern void *func_02005dac(int which, int idx);
extern void func_020944a4(void *src, void *dst, int len);

typedef struct { unsigned int attr01; unsigned short attr2; } OamRec;

void func_ov003_021ceb84(int a0, int a1, int a2, int a3, int a4) {
    OamRec rec;
    int which;
    int tilebase;
    int y;
    int i;
    (void)a0;
    if (a1) which = 1; else which = 2;
    if (a2) tilebase = 0x10; else tilebase = 0x8;
    y = (a2 * 0x18 + 0x94) & 0xff;
    for (i = 0; i < 4; i++) {
        rec.attr01 = (y | 0x4000 | 0x80000000u) | (((a4 + 0x14) & 0x1ff) << 16);
        rec.attr2  = (unsigned short)((tilebase | 0x400) | (a3 << 12));
        func_020944a4(&rec, func_02005dac(which, i), 6);
        a4 += 0x20;
        tilebase += 2;
    }
}
