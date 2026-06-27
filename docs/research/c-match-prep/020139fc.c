/* CAMPAIGN-PREP candidate for func_020139fc (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     constant divisor 0xff => plain '/'; clamp as if-assign (cmp+movgt); call-result first in add
 *   risk:       fold: mwcc at -O4 will very likely const-fold (x*255)/255 -> x and DROP the smull magic, which the orig keeps. If so the whole divmod body diverges. permuter-class / likely needs an opaque divisor or .s.
 *   confidence: low
 */
/* func_020139fc(x): chain a probe, add a scaled term, clamp to 0xff, forward.
 *   ip = x*0xff  (rsb ip,r4,r4,lsl#8)
 *   lr = ip / 0xff (smull 0x80808081 signed reciprocal => /255) == x
 *   r0 = func_02019124() + lr ; if (r0>0xff) r0=0xff ; return func_0201913c(r0)
 * The *0xff//0xff is emitted literally (no fold) in the orig, so write the
 * division explicitly. */
extern int func_02019124(void);
extern int func_0201913c(int v);

int func_020139fc(int x)
{
    int v = func_02019124() + (x * 0xff) / 0xff;
    if (v > 0xff) v = 0xff;
    return func_0201913c(v);
}
