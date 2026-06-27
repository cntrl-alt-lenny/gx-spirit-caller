/* CAMPAIGN-PREP candidate for func_0222f2b0 (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     decl-order out/lo/hi/packed; (u16>>8)&0xff; if-assign packed; bind lo,hi
 *   risk:       Final call writes only r0,r1,stack(r6) leaving r2,r3 stale; real proto likely <4 reg args so my 5-arg form emits spurious mov r2,r3. signature/struct-guessed.
 *   confidence: low
 */
/* func_ov002_0222f2b0 : cls C - stack-out byte unpack, struct args, linear calls */

extern int func_ov002_0223df38(void *self, int zero, int *out);
extern int func_ov002_0225764c(void *self, int lo, int hi);
extern int func_ov002_021d59cc(int lo, int hi, int c, int d, int packed);

int func_ov002_0222f2b0(void *self)
{
    int out;
    int lo, hi;
    int packed;

    if (func_ov002_0223df38(self, 0, &out) == 0)
        return 0;

    lo = out & 0xff;
    hi = ((unsigned short)out >> 8) & 0xff;

    if (func_ov002_0225764c(self, lo, hi) == 0)
        return 0;

    packed = 0;
    if (*(unsigned short *)self == 0x1a0b)
        packed = (((unsigned short *)self)[1] << 31) >> 31;

    func_ov002_021d59cc(lo, hi, lo, hi, packed);
    return 0;
}
