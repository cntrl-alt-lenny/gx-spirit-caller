/* CAMPAIGN-PREP candidate for func_02204cf4 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     bitfield bit0 struct; reload-not-bind (3 ldrh); store-order guard chain; 2-arg tail
 *   risk:       reshape-able: tail 021ff3bc declared 2-arg (asm sets only r0,r1); if real sig is 3-arg mwcc emits extra mov r2 -> diverges. Drop the 3rd param to fix.
 *   confidence: med
 */
/* func_ov002_02204cf4: cls D — bit0 guard chain, store-order tail.
 * 021ca698(bit0, 1-bit0); 022536e8(bit0, f0, 0); 022536e8(bit0, f0, 1);
 * tail 021ff3bc(self, arg1). [self,#2] bit0 RELOADED each use (3 ldrh). */
typedef unsigned short u16;
struct S02204cf4 { u16 f0; u16 bit0:1; u16 rest:15; };
extern int func_ov002_021ca698(int bit0, int notbit0);
extern int func_ov002_022536e8(int bit0, int f0, int which);
extern int func_ov002_021ff3bc(struct S02204cf4 *self, int arg1);
int func_ov002_02204cf4(struct S02204cf4 *self, int arg1) {
    if (func_ov002_021ca698(self->bit0, 1 - self->bit0) == 0) return 0;
    if (func_ov002_022536e8(self->bit0, self->f0, 0) == 0) return 0;
    if (func_ov002_022536e8(self->bit0, self->f0, 1) == 0) return 0;
    return func_ov002_021ff3bc(self, arg1);
}
