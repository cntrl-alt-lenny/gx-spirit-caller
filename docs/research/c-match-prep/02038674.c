/* CAMPAIGN-PREP candidate for func_02038674 (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     sibling of 385f8 all-halfword; ldrsh r2,r3=h0,h2; asr#8; same sign-split clamp; strh store-order
 *   risk:       reshape-able: identical clamp-shape risk as 385f8 (must emit blt;cmp;bgt then cmp;cmplt;bge, not movcc). Differs only in s16 loads/stores; keep if(step>=0){if>}else{if<}. Offsets 0x4(step)/0x6(counter) inferred from the 385f8 sibling.
 *   confidence: med
 */
typedef struct {
    short h0;           /* +0x0 */
    short h2;           /* +0x2 */
    short h4;           /* +0x4 step */
    short h6;           /* +0x6 counter */
} V38;

int func_02038674(V38 *o) {
    int cur = o->h0;   /* r2 (s16) */
    int tgt = o->h2;   /* r3 (s16) */
    if ((cur >> 8) == (tgt >> 8) && o->h6 == 0) {
        return 0;
    }
    o->h6 = o->h6 - 1;
    if (o->h6 > 0) {
        int step = o->h4;
        cur += step;
        if (step >= 0) {
            if (cur > tgt) cur = tgt;
        } else {
            if (cur < tgt) cur = tgt;
        }
        o->h0 = (short)cur;
    } else {
        o->h6 = 0;
        o->h0 = (short)tgt;
    }
    return 1;
}
