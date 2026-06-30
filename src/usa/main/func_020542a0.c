/* CAMPAIGN-PREP candidate for func_020542a0 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     guard on field callback + bind-vs-reload (reload cb)
 *   risk:       callback arg/return type guessed (void*); if cb bound to local the reload ldr disappears
 *   confidence: high
 */
/* func_020542a0: load callback at +0x10, null-check, else call it with
 * the result of func_0205405c(p, idx). Callback is RELOADED after the
 * call (read p->cb twice, do not bind to a local). */

extern void *func_0205405c(void *p, int idx);

typedef struct {
    char  _pad00[0x10];
    void (*cb)(void *);   /* +0x10 */
} Obj02054314;

void func_020542a0(Obj02054314 *p, int idx) {
    if (p->cb != 0)
        p->cb(func_0205405c(p, idx));
}
