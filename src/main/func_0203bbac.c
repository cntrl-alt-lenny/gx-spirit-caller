/* CAMPAIGN-PREP candidate for func_0203bbac (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     Repeated free-if-nonnull then NULL store, store-order; tail null-guard
 *   risk:       func_02038c98 2nd arg=0 assumed; last block uses ldmeqia early-return form
 *   confidence: high
 */
/* func_0203bbac: free four optional pointers at +0x78..+0x84.
 * For each: if(p->fN){ func_02038c98(p->fN,0); p->fN=0; }
 * The last one uses the conditional-return (ldmeqia) epilogue.
 */
extern void func_02038c98(void *ptr, int arg);

typedef struct {
    char   _pad00[0x78];
    void  *f78;   /* +0x78 */
    void  *f7c;   /* +0x7c */
    void  *f80;   /* +0x80 */
    void  *f84;   /* +0x84 */
} Obj;

void func_0203bbac(Obj *p) {
    if (p->f78) { func_02038c98(p->f78, 0); p->f78 = 0; }
    if (p->f7c) { func_02038c98(p->f7c, 0); p->f7c = 0; }
    if (p->f80) { func_02038c98(p->f80, 0); p->f80 = 0; }
    if (p->f84) { func_02038c98(p->f84, 0); p->f84 = 0; }
}
