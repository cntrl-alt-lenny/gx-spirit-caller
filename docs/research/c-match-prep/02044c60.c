/* CAMPAIGN-PREP candidate for func_02044c60 (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     8-byte Pair struct-assign => ldmia/stmia {r2,r3}; ternary flag => streq/strne; store-order p0 then p1
 *   risk:       struct-guessed: Buf/Dst layout (two 8-byte Pairs, flag at 0x10, frame 0x18) inferred from func_02044610 fill — confirm offsets; if Pair isn't seen as one 8-byte unit mwcc emits ldr/str not ldm/stm.
 *   confidence: med
 */
typedef struct { int lo, hi; } Pair;

typedef struct {
    Pair p0;
    Pair p1;
    short e, f;
} Buf;

typedef struct {
    Pair p0;
    Pair p1;
    int flag;
} Dst;

extern void func_02044610(void *buf);

void func_02044c60(Dst *dst)
{
    Buf buf;

    func_02044610(&buf);
    dst->p0 = buf.p0;
    dst->p1 = buf.p1;
    dst->flag = (buf.p0.lo == 0 && buf.p0.hi == 0) ? 0 : 1;
}
