/* CAMPAIGN-PREP candidate for func_02044724 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     memset/fill wrapper + recomputed-base byte SETTER (lsl #8)
 *   risk:       post-call address may be cached differently; func_0209448c arg order (val,ptr,len) assumed from regs
 *   confidence: high
 */
/* func_02044724: clear a 0x100-byte slot at base+(idx<<8), then set byte +0xe7
 * to 0xff. The slot address is rematerialized after the call (caller-clobbered).
 * Prologue saves r4,r5 (odd count) -> sub sp,#4 padding. */

extern void func_0209448c(int a, void *p, int n);

void func_02044724(unsigned char *base, int idx) {
    unsigned char *p = base + (idx << 8);
    func_0209448c(0, p, 0x100);
    p[0xe7] = 0xff;
}
