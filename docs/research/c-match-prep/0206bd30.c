/* CAMPAIGN-PREP candidate for func_0206bd30 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     raw-address callback arg; null-guard global; store; two tail calls
 *   risk:       (void*)0x02000bc4 literal vs &func_02000bc4 symbol reloc; reuse of global-address reg for test+store may flip
 *   confidence: med
 */
/* func_0206bd30: func_02000b60((void*)0x02000bc4); if (data_0219ecd8 != 0)
 * return 0; data_0219ecd8 = p; func_0206bb68(); return func_0206bcec();
 */

extern void *data_0219ecd8;
extern void  func_02000b60(void *cb);
extern void  func_0206bb68(void);
extern int   func_0206bcec(void);

int func_0206bd30(void *p) {
    func_02000b60((void *)0x02000bc4);
    if (data_0219ecd8 != 0)
        return 0;
    data_0219ecd8 = p;
    func_0206bb68();
    return func_0206bcec();
}
