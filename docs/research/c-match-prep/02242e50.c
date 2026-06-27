/* CAMPAIGN-PREP candidate for func_02242e50 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     two bitfields (f6@bit6:6, f12@bit12:2) via && (cmp;cmpeq); arg1 pass-through tail-call
 *   risk:       guard-1 predicates (orig ldmeqia) but guard-2 hard-branches (bne) to shared return 1; two separate `return 1` may be merged/predicated differently than orig's mixed inline+branch. reshape-able (goto-shared-epilogue) else permuter.
 *   confidence: med
 */
/* func_ov002_02242e50: ov002 bitfield guard + id-pair gate, tail call.
 * self->f2 carries a 6-bit field at bit 6 (lsl#20;lsr#26) and a 2-bit
 * field at bit 12 (lsl#18;lsr#30) -> bitfields, not masks. The first
 * guard tests f12==1 first, then (cmpeq) f6==5. */
typedef unsigned short u16;
struct Ov002Self { u16 f0; u16 :6; u16 f6 : 6; u16 f12 : 2; };
extern int func_ov002_0223f684(struct Ov002Self *self, int arg1);

int func_ov002_02242e50(struct Ov002Self *self, int arg1) {
    if (self->f12 == 1 && self->f6 == 5)
        return 1;
    if (self->f0 != 0x1503 && self->f0 != 0x1694)
        return 1;
    return func_ov002_0223f684(self, arg1);
}
