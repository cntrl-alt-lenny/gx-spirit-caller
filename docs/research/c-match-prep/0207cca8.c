/* CAMPAIGN-PREP candidate for func_0207cca8 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     predicated guard-chain + fn-ptr arg + tail call; sp2p3 tier
 *   risk:       func ptr cast may add a pool word vs direct; 0x2144 pool add; arg eval order of the two base+off computations
 *   confidence: med
 */
/* func_0207cca8: linear predicated guard-chain with several bl's, void.
 * base==0 / f2260!=9 / b226b==1 / func_0207c990()==0 / func_0209f720()==2
 * each early-return (predicated); else tail func_0207c934(data_021a089c).
 * Style A epilogue, push {r4,lr}, no sub-sp -> `.legacy.c` (mwcc 1.2/sp2p3).
 * func_0207c9dc is passed by ADDRESS (function pointer) to func_0209f720.
 * 0x2144 -> pool-word add; 0xf00 -> encodable immediate add. */

typedef struct {
    char           _pad[0x2260];
    int            f2260;        /* +0x2260 */
    char           _pad2[0xa];
    unsigned char  b226b;       /* +0x226b */
} ctx_cca8_t;

extern ctx_cca8_t *func_0207b538(void);
extern char data_021a089c[];
extern int  func_0207c990(void *p);
extern int  func_0207c934(void *p);
extern int  func_0207c9dc(void);
extern int  func_0209f720(void *fn, void *a, void *b, int c);

void func_0207cca8(void) {
    ctx_cca8_t *base = func_0207b538();
    if (base == 0) return;
    if (base->f2260 != 9) return;
    if (base->b226b == 1) return;
    if (func_0207c990(data_021a089c) == 0) return;
    if (func_0209f720((void *)func_0207c9dc,
                      (char *)base + 0x2144,
                      (char *)base + 0xf00, 0) == 2) return;
    func_0207c934(data_021a089c);
}
