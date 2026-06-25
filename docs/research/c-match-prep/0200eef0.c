/* CAMPAIGN-PREP candidate for func_0200eef0 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     alloc/copy + flag-guard + conditional field stores + tail-return
 *   risk:       Copy32(o,p) direction per asm; &&-store keeps r0 as edb8 return (no extra mov); field offsets 0x98/0x9c guessed
 *   confidence: high
 */
/* func_0200eef0: like func_0200eea8 but a flag (a2==1) gates the
 * func_0200edb8 dispatch, and on a non-null result with a non-null
 * src it records the src pointer @0x98 and the flag @0x9c. */

extern void Copy32(void *dst, void *src, int n);
extern void Fill32(int value, void *dest, int count);
extern void *func_0200ed48(void);
extern int func_0200edb8(void *p);

int func_0200eef0(void *o, void *src, int flag) {
    void *p = func_0200ed48();
    if (p == 0) return 0;
    if (o == 0) return 0;
    Fill32(0, p, 0x284);
    Copy32(o, p, 0x34);
    if (flag == 1) {
        int *r = (int *)func_0200edb8(p);
        if (r != 0 && src != 0) {
            r[0x98 / 4] = (int)src;
            r[0x9c / 4] = flag;
        }
        return (int)r;
    }
    return 0;
}
