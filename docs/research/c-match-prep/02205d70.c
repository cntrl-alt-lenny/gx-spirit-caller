/* CAMPAIGN-PREP candidate for func_02205d70 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     two bitfield extracts -> 3-arg call; reload self; >=0 bool tail
 *   risk:       struct-guessed: 021b39c4 arity/order (b0,field5,0) inferred from r0/r1/r2=0 build — confirm. Also the second ldrh is a RELOAD; if mwcc caches b0 in a callee-saved reg across the first call, one ldrh diverges (reshape: re-read self->b0).
 *   confidence: med
 */
/* func_ov002_02205d70 (ov002, D) — 021b39c4(b0, field5, 0); if != 0xffff
 * return 0; else 021bd030(b0) and return (result >= 0).
 *   b0     = [r4,#2] lsl#0x1f;lsr#0x1f
 *   field5 = [r4,#2] lsl#0x1a;lsr#0x1b  (:5 after b0)
 *   arg build order in asm: r2=0 first, then r1=field5, r0=b0.
 *   [r4,#2] is RELOADED before the second extract (ldrh twice). */
typedef unsigned short u16;
struct S02205d70 { u16 f0; u16 b0 : 1; u16 field5 : 5; u16 rest : 10; };

extern int func_ov002_021b39c4(int b0, int field5, int zero);
extern int func_ov002_021bd030(int b0);

int func_ov002_02205d70(struct S02205d70 *self) {
    if (func_ov002_021b39c4(self->b0, self->field5, 0) != 0xffff)
        return 0;
    return func_ov002_021bd030(self->b0) >= 0;
}
