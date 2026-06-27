/* CAMPAIGN-PREP candidate for func_02018e88 (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     key==0 branch; streq pair then mla base then strne pair, ordered
 *   risk:       permuter-class: orig schedules `mla r0,(idx-1),0x18,r4` between the two streq stores (both branches' addresses computed eagerly under predication); a plain if/else may emit a real branch instead of streq/strne predication.
 *   confidence: med
 */
/* CAMPAIGN-PREP candidate for func_02018e88 (main, class C) — prep batch p_0004.
 * UNVERIFIED build-free draft. Drop into src/, run ninja+objdiff, tweak per risk.
 *   recipe: branch on key==0; streq pair BEFORE mla, strne pair AFTER; both stores per branch in order
 */
/* func_02018e88: key=r0(->r7), a=r1(->r6), b=r2(->r5). w = GetSystemWork() (->r4).
 * idx = func_02019210(key). If key==0: w[0x908]=a; w[0x90c]=b. Else: e = &w[(idx-1)*0x18];
 * e[0]=a; e[1]=b. The asm computes the mla base (idx-1)*0x18 + w unconditionally and interleaves
 * it between the two streq stores — an if/else over the same a,b should reproduce that schedule. */
extern char *GetSystemWork(void);
extern int func_02019210(int key);

void func_02018e88(int key, int a, int b) {
    char *w = GetSystemWork();
    int idx = func_02019210(key);
    if (key == 0) {
        *(int *)(w + 0x908) = a;
        *(int *)(w + 0x90c) = b;
    } else {
        int *e = (int *)(w + (idx - 1) * 0x18);
        e[0] = a;
        e[1] = b;
    }
}
