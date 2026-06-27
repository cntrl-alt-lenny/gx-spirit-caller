/* CAMPAIGN-PREP candidate for func_02205bbc (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     bit0 struct, reload-not-bind (4 ldrh); 021ca698(bit0,bit0) dup arg; signed <2 guard; 2-arg 021ff3bc
 *   risk:       reshape-able: 021ff3bc declared 2-arg (asm sets only r0,r1) — if real sig is 3-arg, extra mov r2 diverges. Note says no-scheduling so the linear chain itself should match; this is the most tractable.
 *   confidence: med
 */
/* func_ov002_02205bbc: cls D — linear predicate chain, bit0 args, no scheduling.
 * 021ca698(bit0,bit0)!=0; 022536e8(bit0,f0,0)>=2; 021ff3bc(self,arg1)!=0;
 * return 021ca3f0(bit0,0x15be)!=0. bit0 [self,#2] RELOADED each use (4 ldrh). */
typedef unsigned short u16;
struct S05bbc { u16 f0; u16 bit0:1; u16 rest:15; };
extern int func_ov002_021ca698(int bit0a, int bit0b);
extern int func_ov002_022536e8(int bit0, int f0, int which);
extern int func_ov002_021ff3bc(struct S05bbc *self, int arg1);
extern int func_ov002_021ca3f0(int bit0, int magic);
int func_ov002_02205bbc(struct S05bbc *self, int arg1) {
    if (func_ov002_021ca698(self->bit0, self->bit0) == 0) return 0;
    if (func_ov002_022536e8(self->bit0, self->f0, 0) < 2) return 0;
    if (func_ov002_021ff3bc(self, arg1) == 0) return 0;
    return func_ov002_021ca3f0(self->bit0, 0x15be) != 0;
}
