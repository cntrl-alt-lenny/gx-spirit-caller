/* CAMPAIGN-PREP candidate for func_0206aacc (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     null-guard early-return + counted free-list loop (count reloaded)
 *   risk:       None observed: byte-exact under sp3. f8 list ptr at 0x8 guessed. Must route .legacy_sp3.c not sp1p5.
 *   confidence: high
 */
/* func_0206aacc -> route as func_0206aacc.legacy_sp3.c (mwcc 1.2/sp3).
 * Free-list drain: if the list (p->f8) is null, return; else for each of
 * func_02054140(list) entries, fetch entry i via func_020540d0 and release
 * its first word through func_0206b47c; then free the list and clear p->f8.
 * VERIFIED byte-exact under sp3, incl. early-return addeq/popeq and the
 * count reloaded each iteration. */
extern int  func_02054140(void *list);
extern int *func_020540d0(void *list, int i);
extern void func_0206b47c(void *p, int v);
extern void func_02054148(void *list);

struct S { int f0; char p4[4]; void *f8; };

void func_0206aacc(struct S *p) {
    int i;
    if (p->f8 == 0) return;
    for (i = 0; i < func_02054140(p->f8); i++) {
        int *e = func_020540d0(p->f8, i);
        func_0206b47c(p, e[0]);
    }
    func_02054148(p->f8);
    p->f8 = 0;
}
