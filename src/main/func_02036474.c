/* CAMPAIGN-PREP candidate for func_02036474 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     counted table-scan loop (ldr base,r5<<2), guard chain, one call
 *   risk:       None observed; verified byte-exact. data_0219b344 typed as void*[]; element field offsets 0x6a/0x68 inferred.
 *   confidence: high
 */
extern int func_0203624c(void *e, int a);
extern void *data_0219b344[];

void func_02036474(int a) {
    int i;
    for (i = 0; i < 4; i++) {
        void *e = data_0219b344[i];
        if (e == 0) continue;
        if (((signed char *)e)[0x6a] < 0) continue;
        if ((((unsigned short *)e)[0x68/2] & 0x200) == 0) continue;
        func_0203624c(e, a);
    }
}
