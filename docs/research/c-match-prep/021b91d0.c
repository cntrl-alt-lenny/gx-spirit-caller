/* CAMPAIGN-PREP candidate for func_021b91d0 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     D: store-order swap through a stack slot; frame is non-standard (legacy/-O0 straggler)
 *   risk:       permuter-class (frame-routing): DOCUMENTED wall — the `stmfd {r3}; sub sp,#4; str [sp]; ...; add sp; ldmfd {r3}; bx lr` prologue/epilogue is emitted by NO available mwcc revision. No C reshape or compiler-route matches; ship as .s. struct-guessed arg direction.
 *   confidence: low
 */
/* func_ov002_021b91d0: swap two ints *a <-> *b via a stack temp. NOTE: this is
 * a DOCUMENTED straggler (brief 350/358) — its `stmfd {r3}; sub sp,#4; ...;
 * bx lr` frame matches NEITHER mwcc 2.0 NOR 1.2/sp2p3 NOR 1.2/sp3; it ships as
 * whole-function .s. The C below is the semantic intent only. */
void func_ov002_021b91d0(int *a, int *b) {
    int t;
    t = *a;
    *b = t;       /* str r3,[r0]  -> wait: orig stores old *a into *b? */
    *a = *b;
    (void)t;
}
