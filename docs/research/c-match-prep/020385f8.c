/* CAMPAIGN-PREP candidate for func_020385f8 (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     ldmia r0={r2,r3}=w0,w4; asr#8 signed >>; clamp as nested if-assign per sign; store-order
 *   risk:       reshape-able: clamp must compile to blt/cmp/bgt then cmp/cmplt (the .L_58/.L_64/.L_68 chain). A ternary or min/max idiom emits movcc and diverges; the if(step>=0){if>}else{if<} shape is required. Field offsets 0x8/0xa load-bearing.
 *   confidence: med
 */
typedef struct {
    int w0;             /* +0x0 */
    int w4;             /* +0x4 */
    short h8;           /* +0x8 step */
    short ha;           /* +0xa counter */
} V37;

int func_020385f8(V37 *o) {
    int cur = o->w0;   /* r2 */
    int tgt = o->w4;   /* r3 */
    if ((cur >> 8) == (tgt >> 8) && o->ha == 0) {
        return 0;
    }
    o->ha = o->ha - 1;
    if (o->ha > 0) {
        int step = o->h8;
        cur += step;
        if (step >= 0) {
            if (cur > tgt) cur = tgt;
        } else {
            if (cur < tgt) cur = tgt;
        }
        o->w0 = cur;
    } else {
        o->ha = 0;
        o->w0 = tgt;
    }
    return 1;
}
