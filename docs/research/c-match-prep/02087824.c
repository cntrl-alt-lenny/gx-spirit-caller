/* CAMPAIGN-PREP candidate for func_02087824 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     List-scan-by-field loop; insert; trailing back-link store
 *   risk:       movs flag-reuse + r4/r5 arg caching reg-alloc sensitive; struct offsets (f4@4,f3d@3d) guessed
 *   confidence: low
 */
/* func_02087824: like func_020877c8 but with a base/node arg passed in and a
 * trailing back-link store. r5=base(arg0), r4=node(arg1). Walk
 * func_0207cfdc(base, node) (node=0 -> first), stop when node->f3d > arg1->f3d.
 * func_0207d05c(base, stop, arg1) then arg1->f4 = base.
 */

struct Func02087824Obj {
    char _pad00[0x4];
    void *f4;
    char _pad08[0x35];
    unsigned char f3d;
};

extern struct Func02087824Obj *func_0207cfdc(void *base, struct Func02087824Obj *cur);
extern void func_0207d05c(void *base, struct Func02087824Obj *before, void *q);

void func_02087824(void *base, struct Func02087824Obj *q) {
    struct Func02087824Obj *it = func_0207cfdc(base, 0);
    while (it != 0) {
        if (q->f3d < it->f3d) break;
        it = func_0207cfdc(base, it);
    }
    func_0207d05c(base, it, q);
    q->f4 = base;
}
