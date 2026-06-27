/* CAMPAIGN-PREP candidate for func_0207103c (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     D divmod/64-bit: umull as u64 mul; hi-word mla corrections; 64-bit add via adds/adc
 *   risk:       64-bit emit order/regs: orig interleaves the final adds/adc with the g4/g5 loads in a specific schedule; mwcc's u64 lowering may pick a different reg/schedule for adds/adc -> permuter-class scheduling coin-flip
 *   confidence: low
 */
/* func_0207103c: 64-bit multiply-accumulate advance of a {lo,hi} state.
 * Operates on a global u32 array g = data_0219ef3c.
 *   umull lo64 = g[2]*g[0]; hi += g[2]*g[1]; hi += g[3]*g[0];
 *   {g[0],g[1]} = {g[4],g[5]} + {lo,hi}   (64-bit add)
 *
 *   ldr r3,[g+8]; ldr r2,[g+0]; ldr r0,[g+4]
 *   umull lr,ip, r3,r2        ; (ip:lr) = g2*g0
 *   mla ip, r3,r0,ip          ; hi += g2*g1
 *   ldr r0,[g+0xc]; ldr r3,[g+0x10]
 *   mla ip, r0,r2,ip          ; hi += g3*g0
 *   adds r2, r3, lr           ; lo' = g4 + lo  (r3==g4)
 *   ldr r0,[g+0x14]           ; g5
 *   str r2,[g+0]
 *   adc r0, r0, ip            ; hi' = g5 + hi + carry
 *   str r0,[g+4]
 */

extern unsigned int data_0219ef3c[];

void func_0207103c(void) {
    unsigned int *g = data_0219ef3c;
    unsigned long long prod = (unsigned long long)g[2] * g[0];
    unsigned int hi = (unsigned int)(prod >> 32) + g[2] * g[1] + g[3] * g[0];
    unsigned long long acc = ((unsigned long long)hi << 32) | (unsigned int)prod;
    acc += ((unsigned long long)g[5] << 32) | g[4];
    g[0] = (unsigned int)acc;
    g[1] = (unsigned int)(acc >> 32);
}
