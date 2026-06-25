/* CAMPAIGN-PREP candidate for func_0208787c (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     STORE-ORDER field init (asm order: 2e,2d,2f,34,3e); shared 0x7f const; embedded-struct calls
 *   risk:       Field order in C must match asm store order; offsets/struct shape guessed; &p->sub vs add r0,#0x1c addressing
 *   confidence: med
 */
/* func_0208787c: zero-init a run of fields IN STORE ORDER, set two 0x7f
 * bytes, then two sub-init calls on the embedded struct at +0x1c.
 * Store order from asm: f2e(b)=0, f2d(b)=0, f2f(b)=0, f34(h)=0, f3e(h)=0,
 * f40(b)=0x7f, f41(b)=0x7f. Then func_0208b0d0(&p->f1c);
 * func_0208b0a4(&p->f1c, 0x7f00, 1). The 0x7f constant is shared (r1).
 */

struct Func0208787cObj {
    char _pad00[0x1c];
    char sub[0x11];        /* embedded at +0x1c */
    unsigned char f2d;
    unsigned char f2e;
    unsigned char f2f;
    char _pad30[0x4];
    unsigned short f34;
    char _pad36[0x8];
    unsigned short f3e;
    unsigned char f40;
    unsigned char f41;
};

extern void func_0208b0d0(void *sub);
extern void func_0208b0a4(void *sub, int a, int b);

void func_0208787c(struct Func0208787cObj *p) {
    p->f2e = 0;
    p->f2d = 0;
    p->f2f = 0;
    p->f34 = 0;
    p->f3e = 0;
    p->f40 = 0x7f;
    p->f41 = 0x7f;
    func_0208b0d0(&p->sub);
    func_0208b0a4(&p->sub, 0x7f00, 1);
}
