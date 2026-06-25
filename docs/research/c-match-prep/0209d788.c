/* CAMPAIGN-PREP candidate for func_0209d788 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     leaf conditional RMW bit-clear (ands/bic)
 *   risk:       mwcc may reload *p instead of reusing v, or emit movne-store ordering; literal 0x027fff96 must land in the pool
 *   confidence: med
 */
/* CAMPAIGN-PREP candidate for func_0209d788 (main, class A) — front-load.
 * UNVERIFIED build-free draft.
 *   recipe:     leaf conditional read-modify-write bit-clear on a fixed MMIO halfword
 *   risk:       ands(&1)/bic(&~1) RMW; value held in one reg (no reload) — if mwcc reloads *p the strneh predicate may differ
 */
void func_0209d788(void) {
    unsigned short *p = (unsigned short *)0x027fff96;
    unsigned short v = *p;
    if (v & 1) {
        *p = (unsigned short)(v & ~1);
    }
}
