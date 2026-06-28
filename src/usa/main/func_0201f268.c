/* CAMPAIGN-PREP candidate for func_0201f268 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     GUARD chain (2-arm); predicated early-return; tail f138(9)
 *   risk:       tails must not emit mov #0 (return f138 value); f_2 offset guessed
 *   confidence: med
 */
/* func_0201f268: smaller sibling of func_0201f1a4. If arg->f_2 (u16) != 0:
 * f19c(); return f138(9). Else r=f2f4(); if r!=0 return r; else return
 * f138(9). f19c() called with no args. */

typedef struct {
    char _pad2[2];
    unsigned short f_2;    /* +0x02 */
} hdr_f2bc;

extern int func_0201f0e4(int n);
extern void func_0201f148(void);
extern int func_0201f2a0(void);

int func_0201f268(hdr_f2bc *p) {
    int r;
    if (p->f_2 != 0) {
        func_0201f148();
        return func_0201f0e4(9);
    }
    r = func_0201f2a0();
    if (r != 0) {
        return r;
    }
    return func_0201f0e4(9);
}
