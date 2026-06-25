/* CAMPAIGN-PREP candidate for func_0203cb0c (main, class B) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     shifted-add address (acc-first), Copy32 call wrapper
 *   risk:       Copy32 arg order (src,dst,n) assumed; add base+(a0<<8) must keep base as first add operand; func_0203c900 retyped char* (was void*).
 *   confidence: high
 */
/* func_0203cb0c: copy 0xf0 bytes from a1 into base+(a0<<8), where
 * base = func_0203c900(0x10). Copy32(src, dst, n).
 */
extern char *func_0203c900(int sel);
extern void Copy32(void *src, void *dst, int n);

void func_0203cb0c(int a0, void *a1)
{
    char *base = func_0203c900(0x10);
    Copy32(a1, base + (a0 << 8), 0xf0);
}
