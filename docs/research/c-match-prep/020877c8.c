/* CAMPAIGN-PREP candidate for func_020877c8 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     List-scan-by-field loop (movs flag-reuse); base held in callee-saved; insert tail call
 *   risk:       movs r1,r0 flag reuse, callee-saved base reg, and loop-carried it into 3rd arg are reg-alloc sensitive; offsets guessed
 *   confidence: low
 */
/* func_020877c8: sorted-by-f3d list reinsert. Walk the list rooted at
 * data_021a4868 via func_0207cfdc(base, node) (node=0 -> first). Stop at
 * the first node whose f3d > p->f3d (cmp; bcc breaks when p->f3d < it->f3d).
 * Then func_0207d05c(base, stop_node, p) inserts p before stop_node (0=tail).
 * base is held in a callee-saved reg (r4) across the whole loop.
 */

struct Func020877c8Obj {
    char _pad00[0x3d];
    unsigned char f3d;
};

extern char data_021a4868[];
extern struct Func020877c8Obj *func_0207cfdc(char *base, struct Func020877c8Obj *cur);
extern void func_0207d05c(char *base, struct Func020877c8Obj *before, void *p);

void func_020877c8(struct Func020877c8Obj *p) {
    struct Func020877c8Obj *it = func_0207cfdc(data_021a4868, 0);
    while (it != 0) {
        if (p->f3d < it->f3d) break;
        it = func_0207cfdc(data_021a4868, it);
    }
    func_0207d05c(data_021a4868, it, p);
}
