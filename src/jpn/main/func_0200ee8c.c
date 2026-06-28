/* CAMPAIGN-PREP candidate for func_0200ee8c (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     alloc(func_0200ed2c)+Fill32+Copy32+tail func_0200ed9c; null-guards
 *   risk:       Copy32/Fill32 arg order assumed (dest,src,n)/(val,dest,n) from peer corpus; ed48 return treated as void*; sizes 0x284/0x34 fixed
 *   confidence: high
 */
/* func_0200ee8c: allocate a record (func_0200ed2c), zero its 0x284
 * bytes, copy 0x34 bytes between the caller buffer and the new record,
 * then hand it to func_0200ed9c. Null/alloc-fail -> return 0. */

extern void Copy32(void *dst, void *src, int n);
extern void Fill32(int value, void *dest, int count);
extern void *func_0200ed2c(void);
extern int func_0200ed9c(void *p);

int func_0200ee8c(void *o) {
    void *p = func_0200ed2c();
    if (p == 0) return 0;
    if (o == 0) return 0;
    Fill32(0, p, 0x284);
    Copy32(o, p, 0x34);
    return func_0200ed9c(p);
}
