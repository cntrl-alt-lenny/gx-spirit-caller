/* CAMPAIGN-PREP candidate for func_02062df8 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     out-param probe (b+7 arg, const 0), helper on p+0x50, bool tail
 *   risk:       `(char*)p+0x50` base-add; a,b reg-alloc (r5/r4); b+7 fold; clone of 02062ba4
 *   confidence: med
 */
/* func_02062df8: clone of 02062ba4 with first probe const 0 instead of
 * 5: func_02062eec(p, 0, b+7, &out); then func_020613d8(p+0x50, a, b);
 * normalize func_02062e6c. args r0=p, r1=a, r2=b. */

extern int  func_02062eec(void *p, int a, int b, int *out);
extern void func_020613d8(void *sub, int a, int b);
extern int  func_02062e6c(void *p);

int func_02062df8(void *p, int a, int b) {
    int out;
    if (!func_02062eec(p, 0, b + 7, &out))
        return 0;
    if (out)
        return 1;
    func_020613d8((char *)p + 0x50, a, b);
    return func_02062e6c(p) ? 1 : 0;
}
