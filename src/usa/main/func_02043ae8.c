/* CAMPAIGN-PREP candidate for func_02043ae8 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     masked SETTER + cond store + RELOAD global on final read
 *   risk:       final read may reuse cached address reg instead of the fresh ldr the asm shows
 *   confidence: med
 */
/* func_02043ae8: write masked value to a u16 global, set a flag global to 1,
 * conditionally overwrite the u16 with 0xff, return the u16. r0 (a0) unused.
 * The final read reloads data_0219d990's address (independent global access). */

extern unsigned short data_0219d990;   /* u16 */
extern int            data_0219d994;

unsigned short func_02043ae8(int a0, int a1, int a2) {
    data_0219d990 = (unsigned short)(a1 & 0xff);
    data_0219d994 = 1;
    if (a2 != 0) data_0219d990 = 0xff;
    return data_0219d990;
}
