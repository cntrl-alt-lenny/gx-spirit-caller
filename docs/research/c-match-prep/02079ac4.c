/* CAMPAIGN-PREP candidate for func_02079ac4 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     carry-propagate add loop, u16 store + >>16 carry
 *   risk:       reg-alloc of index/carry temps may flip; early-exit-on-zero-carry epilogue duplication may schedule differently
 *   confidence: med
 */
/* func_02079ac4: add `add` into a little-endian u16 limb array starting at
 * limb 0, propagating carry upward. Stops when the carry becomes 0 or the
 * limb index reaches `len`.
 *
 *   i = 0; while (carry != 0) { if (i>=len) break;
 *           sum = limbs[i] + carry; limbs[i] = (u16)sum; carry = sum>>16; i++; }
 * The asm checks carry==0 at the top (returns immediately) then i<len.
 */

void func_02079ac4(unsigned short *limbs, unsigned int carry, int len) {
    int i = 0;
    while (carry != 0) {
        unsigned int sum;
        if (i >= len) {
            return;
        }
        sum = limbs[i] + carry;
        limbs[i] = (unsigned short)sum;
        carry = sum >> 16;
        i++;
    }
}
