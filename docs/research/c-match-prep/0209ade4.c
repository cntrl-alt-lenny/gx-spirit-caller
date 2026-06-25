/* CAMPAIGN-PREP candidate for func_0209ade4 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     call + early-return guard; NULL-checked bit-test out-params (movne/moveq)
 *   risk:       void return matches the no-final-mov-r0 tail; stack slot for v and the two conditional-return epilogue copies should line up.
 *   confidence: med
 */
/* func_0209ade4: query a u16 status word, split two of its bits into
 * boolean out-params. func_0209b0b8(0,&v) fills v; on error just return.
 * out_a (arg0) <- bit 3 (0x8), out_b (arg1) <- bit 2 (0x4), each as 0/1,
 * skipped when the pointer is NULL. Return value is unused (void).
 */

extern int func_0209b0b8(int sel, unsigned short *out);

void func_0209ade4(int *out_a, int *out_b) {
    unsigned short v;

    if (func_0209b0b8(0, &v) != 0) return;
    if (out_a != 0) *out_a = (v & 0x8) ? 1 : 0;
    if (out_b != 0) *out_b = (v & 0x4) ? 1 : 0;
}
