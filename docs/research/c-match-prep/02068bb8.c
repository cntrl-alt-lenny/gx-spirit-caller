/* CAMPAIGN-PREP candidate for func_02068bb8 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     Global null-check + RELOAD-each-use + free + clear-to-NULL
 *   risk:       Must reload the global (not bind) so mwcc emits 3 ldr; if it caches the ptr in a callee-saved reg the load count differs.
 *   confidence: med
 */
/* func_02068bb8: if global is null, bail. If func_02054614(global)
 * returns nonzero, bail. Else func_02054684(global) and clear global
 * to NULL. Global referenced directly each use to force the reloads. */

extern void *data_0219ecc8;
extern int  func_02054614(void *p);
extern void func_02054684(void *p);

void func_02068bb8(void) {
    if (data_0219ecc8 == 0) return;
    if (func_02054614(data_0219ecc8) != 0) return;
    func_02054684(data_0219ecc8);
    data_0219ecc8 = 0;
}
