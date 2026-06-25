/* CAMPAIGN-PREP candidate for func_02092368 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     store literal to global; return-the-stored-value leaf
 *   risk:       return-value reliance: orig leaves const in r0; assignment-expression return must reuse that reg
 *   confidence: high
 */
/* CAMPAIGN-PREP candidate for func_02092368 (main, class A) - p_0035.
 * UNVERIFIED build-free draft: drop into src/, ninja + objdiff, tweak per risk.
 *   recipe:     store literal constant to global (leaf); r0 left = the stored value
 *   risk:       return type: orig leaves the constant in r0 (declared int) so callers using &3 still match; bx lr only if no frame
 *   confidence: high
 */
/* func_02092368: write 0x82000001 to *data_021024b0. The constant is loaded
 * into r0 then stored, so r0 still holds 0x82000001 at return -> declare it
 * returning int so func_02092ca0's `& 3` guard sees the value. */
extern int data_021024b0;

int func_02092368(void)
{
    return data_021024b0 = 0x82000001;
}
