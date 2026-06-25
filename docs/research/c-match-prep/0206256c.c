/* CAMPAIGN-PREP candidate for func_0206256c (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     equality guard early-return, address-of-locals out-params, two-branch dispatch
 *   risk:       param-home/local stack-slot reuse (the {r0-r3} home + locals aliasing) may not reproduce; offsets 0xc/0x98 guessed
 *   confidence: low
 */
/* func_0206256c: guard p->_0xc == 5, else return. Then fill two int
 * out-locals via func_02064db0(&a,&b) and dispatch on
 * func_02054140(p->_0x98):
 *   if (count) func_020618a8(p, 0, a, b, c);   // c is the 4th param
 *   else       func_0206280c(p, a, b, c);
 * The 4 incoming params are homed (stmdb {r0-r3}); a,b reuse the
 * param-home slots as locals. */

extern void func_02064db0(int *out_a, int *out_b);
extern int  func_02054140(void *list);
extern void func_020618a8(void *p, int z, int a, int b, int c);
extern void func_0206280c(void *p, int a, int b, int c);

typedef struct Obj {
    char  _pad_00[0xc];
    int   field_c;            /* +0xc */
    char  _pad_10[0x98 - 0x10];
    void *list_98;            /* +0x98 */
} Obj;

void func_0206256c(Obj *p, int p1, int p2, int c) {
    int a, b;
    if (p->field_c != 5)
        return;
    func_02064db0(&a, &b);
    if (func_02054140(p->list_98)) {
        func_020618a8(p, 0, a, b, c);
    } else {
        func_0206280c(p, a, b, c);
    }
}
