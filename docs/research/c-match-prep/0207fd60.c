/* CAMPAIGN-PREP candidate for func_0207fd60 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     INIT store-order; -1 via mvn; sub-object addr; three calls
 *   risk:       f38 sub-object type guessed; reg r4/r5 caching of args/this should match.
 *   confidence: med
 */
/* func_0207fd60: init. p->f30=arg2; p->f34=-1;
 * func_0207f8c8(&p->f38,1); func_0207e8b8(p); func_0207fd48(p,arg1). */

typedef struct Sub Sub;

typedef struct {
    unsigned char _pad00[0x30];
    int  f30;            /* 0x30 */
    int  f34;            /* 0x34 */
    Sub *f38_addr;       /* 0x38 (placeholder; address taken) */
} T;

extern void func_0207f8c8(Sub *sub, int v);
extern void func_0207e8b8(T *p);
extern void func_0207fd48(T *p, int arg1);

void func_0207fd60(T *p, int arg1, int arg2) {
    p->f30 = arg2;
    p->f34 = -1;
    func_0207f8c8((Sub *)&p->f38_addr, 1);
    func_0207e8b8(p);
    func_0207fd48(p, arg1);
}
