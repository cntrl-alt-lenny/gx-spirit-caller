/* CAMPAIGN-PREP candidate for func_02091c44 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     bind double-indirect base; NULL-guard blx; tail call
 *   risk:       field 0xb4 offset guessed; blx vs OS_DisableIrq scheduling; reload-vs-bind of base ptr
 *   confidence: med
 */
/* CAMPAIGN-PREP candidate for func_02091c44 (main, class A) - p_0035.
 * UNVERIFIED build-free draft: drop into src/, ninja + objdiff, tweak per risk.
 *   recipe:     BIND double-indirect global base + NULL-guarded blx callback + tail call
 *   risk:       data_021a63c8 reloaded-vs-bound; field 0xb4 offset guessed; blx scheduling vs OS_DisableIrq
 *   confidence: med
 */
/* func_02091c44: fetch (**data_021a63c8), read callback at +0xb4; if non-null,
 * clear the field then blx the callback and call OS_DisableIrq(); always end
 * with func_02091be4(). Field cleared BEFORE the call (re-entrancy guard).
 */
extern void OS_DisableIrq(void);
extern void func_02091be4(void);
extern void **data_021a63c8;   /* ptr to ptr-to-struct */

typedef void (*cb_t)(void);

void func_02091c44(void)
{
    char *base = (char *)(*data_021a63c8);
    cb_t cb = *(cb_t *)(base + 0xb4);
    if (cb) {
        *(cb_t *)(base + 0xb4) = 0;
        cb();
        OS_DisableIrq();
    }
    func_02091be4();
}
