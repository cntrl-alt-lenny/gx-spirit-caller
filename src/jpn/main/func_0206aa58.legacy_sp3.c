/* CAMPAIGN-PREP candidate for func_0206aa58 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     null-guard early-return + counted free-list loop (count reloaded)
 *   risk:       None observed: byte-exact under sp3. f8 list ptr at 0x8 guessed. Must route .legacy_sp3.c not sp1p5.
 *   confidence: high
 */
/* func_0206aa58 -> route as func_0206aa58.legacy_sp3.c (mwcc 1.2/sp3).
 * Free-list drain: if the list (p->f8) is null, return; else for each of
 * func_020540cc(list) entries, fetch entry i via func_0205405c and release
 * its first word through func_0206b408; then free the list and clear p->f8.
 * VERIFIED byte-exact under sp3, incl. early-return addeq/popeq and the
 * count reloaded each iteration. */
extern int  func_020540cc(void *list);
extern int *func_0205405c(void *list, int i);
extern void func_0206b408(void *p, int v);
extern void func_020540d4(void *list);

struct S { int f0; char p4[4]; void *f8; };

void func_0206aa58(struct S *p) {
    int i;
    if (p->f8 == 0) return;
    for (i = 0; i < func_020540cc(p->f8); i++) {
        int *e = func_0205405c(p->f8, i);
        func_0206b408(p, e[0]);
    }
    func_020540d4(p->f8);
    p->f8 = 0;
}
