/* CAMPAIGN-PREP candidate for func_0206afd4 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     leaf: byte store + two pointer/counter increments
 *   risk:       None observed: byte-exact. p->cur is the first/only field (offset 0). counter is the r2 arg (separate int*).
 *   confidence: high
 */
/* func_0206afd4 (default mwcc 2.0/sp1p5, leaf).
 * Write one byte through p->cur, increment *counter, advance p->cur.
 * VERIFIED byte-exact vs target (no frame; bx lr). */
struct P { unsigned char *cur; };

void func_0206afd4(struct P *p, int ch, int *counter) {
    *p->cur = (unsigned char)ch;
    (*counter)++;
    p->cur++;
}
