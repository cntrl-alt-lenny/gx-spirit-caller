/* CAMPAIGN-PREP candidate for func_0208cf6c (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     save arg field, clear it, OR into global (global-first), tail call, return saved
 *   risk:       r4 must hold the saved u16 across the call and be the return value; mwcc reg-alloc may not preserve r4 the same way (this is why it shipped as .s)
 *   confidence: low
 */
/* func_0208cf6c: read u16 at *p, clear it, OR it into data_021a6304
 * (orig orders `orr r2,r2,r4` = global | saved), call func_0208dce4
 * with the saved bits, return the saved bits.
 *
 *     v = *(u16*)p;
 *     *(u16*)p = 0;
 *     *(u16*)data_021a6304 |= v;
 *     func_0208dce4(v);
 *     return v;
 */

extern unsigned short data_021a6304;
extern void func_0208dce4(int bits);

int func_0208cf6c(unsigned short *p) {
    unsigned short v = *p;
    *p = 0;
    data_021a6304 |= v;
    func_0208dce4(v);
    return v;
}
