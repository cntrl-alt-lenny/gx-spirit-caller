/* CAMPAIGN-PREP candidate for func_02087348 (main, class B) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     Bit-scan loop (ands+conditional set); running-mask; reload-global-on-hit
 *   risk:       Conditional ldreq/orreq/streq block and running lsl mask are reg-alloc/strength-reduction sensitive; likely diff
 *   confidence: low
 */
/* func_02087348: find the first clear bit in data_021a4854 (scan i=0..7),
 * set it, and return its index; return -1 if all 8 low bits are set.
 * The original loads the word once, keeps a running mask (1<<i via lsl #1),
 * and on the hit reloads &data inside the conditional block for the OR/store.
 */

extern unsigned int data_021a4854;

int func_02087348(void) {
    unsigned int bits = data_021a4854;
    int i;
    for (i = 0; i < 8; i++) {
        if ((bits & (1u << i)) == 0) {
            data_021a4854 |= (1u << i);
            return i;
        }
    }
    return -1;
}
