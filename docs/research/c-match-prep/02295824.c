/* CAMPAIGN-PREP candidate for func_02295824 (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     C bind b0 in r4 before call1 (arg is p, not b0); inline-reread for call3; a*700
 *   risk:       orig computes b0 into r4 BEFORE call1 though call1's arg is p (so 'int b0=p->b0' must precede the call); mwcc may sink the read past call1. plus call3 reload boundary. permuter-class.
 *   confidence: med
 */
/* func_ov002_02295824: sibling of 02295748 with scale 0x2bc(700) and a
 * different first callee (022577dc takes the struct ptr, not b0).
 * b0 = p->b0 (computed into callee r4 before call 1).
 *   a = 022577dc(p);
 *   if *(int*)(base + ((1-b0)&1)*0x868) <= a*700   -> return 1
 *   if 021bbf50(b0) > 1:
 *       if 0227d660(b0, 0) >= 0                     -> return 1
 *   return 0
 * call 3 re-reads p->b0 inline (separate ldrh), matching the asm. */
extern char data_ov002_022cf16c[];
extern int  func_ov002_021bbf50(int v);
extern int  func_ov002_022577dc(struct Ov002Hdr1 *p);
extern int  func_ov002_0227d660(int b0, int z);

struct Ov002Hdr1 { char _p2[2]; unsigned short b0 : 1; };

int func_ov002_02295824(struct Ov002Hdr1 *p) {
    int b0 = p->b0;
    int a;

    a = func_ov002_022577dc(p);
    if (*(int *)(data_ov002_022cf16c + ((1 - b0) & 1) * 0x868) <= a * 700)
        return 1;
    if (func_ov002_021bbf50(b0) > 1) {
        if (func_ov002_0227d660(p->b0, 0) >= 0)
            return 1;
    }
    return 0;
}
