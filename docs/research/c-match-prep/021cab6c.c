/* CAMPAIGN-PREP candidate for func_021cab6c (ov006, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     decl-order = first-use; signed >>1 via (x<<k)>>1; if-assign nest for cmpge/cmple chains
 *   risk:       permuter-class: loop body rotates r4/r5/r8 (center,scratch,idx); mwcc will likely pick a different scratch reg for ((k<<6)>>1), diverging the loop-interior allocation.
 *   confidence: low
 */
/* func_ov006_021cab6c: per-column point-in-box hit test.
   r0=obj*, r1=px, r2=py, r3=out{flag,index}. cls C (loop reg-alloc). */

typedef struct {
    char _pad58[0x58];
    int  f58;   /* 0x58 width-ish */
    int  f5c;   /* 0x5c */
    int  f60;   /* 0x60 count */
    char _pad64[0x78 - 0x64];
    int  f78;   /* 0x78 center x base */
    int  f7c;   /* 0x7c center y base */
} Obj_021cab6c;

typedef struct {
    int flag;
    int index;
} HitOut_021cab6c;

int func_ov006_021cab6c(Obj_021cab6c *o, int px, int py, HitOut_021cab6c *out)
{
    int count;
    int cy;
    int cx;
    int top, bottom;
    int idx;
    int k;

    out->flag = 0;
    out->index = 0;
    count = o->f60;
    if (count > 0) {
        cy = o->f7c + (o->f5c << 3) - 0x16;
        cx = o->f78 + ((o->f58 << 3) >> 1);
        bottom = cy + 0xc;
        top    = cy - 0xc;
        k = 1 - count;
        idx = 0;
        do {
            int center = cx + ((k << 6) >> 1);
            if (px >= center - 0x1c && py >= top) {
                if (px <= center + 0x1c && py <= bottom) {
                    out->flag = 1;
                    out->index = idx;
                    return 1;
                }
            }
            idx++;
            k += 2;
        } while (idx < count);
    }
    out->flag = 0;
    return 0;
}
