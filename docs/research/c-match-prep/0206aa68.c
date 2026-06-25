/* CAMPAIGN-PREP candidate for func_0206aa68 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     reset with guarded frees + sentinel; store-order
 *   risk:       One reg coin-flip: mwcc builds -1 via sub r1,r1,#1 reusing the zero (r1) vs target's mov r0,#0 + independent mvn r1,#0. Permuter/Mac-lane class.
 *   confidence: med
 */
/* func_0206aa68 (default mwcc 2.0/sp1p5).
 * Reset: guarded-free p->f7c, clear f7c/f80; guarded-free p->f4b0 (sentinel
 * -1), set f4b0=-1, f0=1, run free-list teardown (0206aacc); set f484=-1,
 * run array teardown (0206ab3c). Body matches target EXCEPT one constant-
 * materialization coin-flip (see risk). */
extern void func_020453b4(int h);
extern void func_02054e70(int h);
extern void func_0206aacc(void *p);
extern void func_0206ab3c(void *p);

struct S {
    int  f0;          /* 0x00 */
    char p4[0x78];
    int  f7c;         /* 0x7c */
    int  f80;         /* 0x80 */
    char p84[0x400];
    int  f484;        /* 0x484 */
    char p488[0x28];
    int  f4b0;        /* 0x4b0 */
};

void func_0206aa68(struct S *p) {
    int h;
    if (p->f7c != 0) func_020453b4(p->f7c);
    p->f7c = 0;
    p->f80 = 0;
    h = p->f4b0;
    if (h != -1) func_02054e70(h);
    p->f4b0 = -1;
    p->f0 = 1;
    func_0206aacc(p);
    p->f484 = -1;
    func_0206ab3c(p);
}
