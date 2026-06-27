/* CAMPAIGN-PREP candidate for func_0221be00 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     class D: :1 owner / bit2(f4) tests; 0223de94 packed return split bit0/(>>8)&ff; two stacked args via [sp],[sp+4]
 *   risk:       reshape-able: the 6-arg tail 021d5a08(self, ip&0xff, (ip>>8 asr)&0xff, f0, [sp]=1, [sp+4]=owner) — store-order of the two stack args (1 then owner) and the asr#8 (signed) on ip must match; if mwcc widens ip or swaps stack stores the str [sp]/[sp+4] order diverges.
 *   confidence: med
 */
/* func_ov002_0221be00 (ov002, class D, MED) — UNVERIFIED build-free draft.
 * pack-dispatch (021e276c) then bit2(f4) early-out; resolve (0223df38/0223de94),
 * forward as 021d5a08(self, lo, hi, f0, [sp]=1, [sp+4]=owner). lo=ret&0xff,
 * hi=(ret>>8 signed)&0xff.
 */
typedef unsigned short u16;

struct CmdEvt { u16 f0; u16 owner : 1; u16 _b1 : 1; u16 b2 : 1; u16 _r2 : 13; u16 f4unused; };

extern int func_ov002_021d5a08(int self, int lo, int hi, int f0, int s0, int s1);
extern int func_ov002_021e276c(int a, int b, int c, int d);
extern int func_ov002_0223de94(void *self, int k);
extern int func_ov002_0223df38(void *self, int b, int c);

int func_ov002_0221be00(struct CmdEvt *self)
{
    func_ov002_021e276c(self->owner, self->f0, 1, 0);
    if (self->b2)
        return 0;
    if (func_ov002_0223df38(self, 0, 0) == 0)
        return 0;
    {
        int ip = func_ov002_0223de94(self, 0);
        func_ov002_021d5a08(self, ip & 0xff, ((int)((u16)ip) >> 8) & 0xff,
                            self->f0, 1, self->owner);
    }
    return 0;
}
