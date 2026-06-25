/* CAMPAIGN-PREP candidate for func_02000f84 (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     D: store-order + RELOAD global across call (no bound base local)
 *   risk:       reshape-able: orig RELOADs data_021040ac post-call (two ldr); if mwcc binds it in a callee-saved reg one ldr is dropped. Fix = reference global directly so the call forces reload.
 *   confidence: high
 */
/* func_02000f84: increment f_b64, call, store ret to global, zero four fields.
 *   push {r3,lr}; ldr base; f_b64++; bl func_02000c4c; RELOAD base;
 *   data_02102c60 = ret; f_b6c=f_b70=f_b74=f_b78=0; pop.
 * Class D: store-order + bind/RELOAD. The orig RELOADS data_021040ac AFTER
 * the call (two `ldr =data_021040ac`), so reference the global directly each
 * time (do NOT bind a base local) -- the call clobbers it, forcing the reload.
 * Field offsets confirmed vs neighbor func_02000ec8 (state_021040ac_t). */

typedef struct {
    char         _pad0[0xb64];
    int          f_b64;   /* +0xb64 */
    int          f_b68;   /* +0xb68 */
    int          f_b6c;   /* +0xb6c */
    int          f_b70;   /* +0xb70 */
    int          f_b74;   /* +0xb74 */
    int          f_b78;   /* +0xb78 */
} state_021040ac_t;

extern state_021040ac_t data_021040ac;
extern void *data_02102c60;
extern void *func_02000c4c(void);

void func_02000f84(void) {
    data_021040ac.f_b64++;
    data_02102c60 = func_02000c4c();
    data_021040ac.f_b6c = 0;
    data_021040ac.f_b70 = 0;
    data_021040ac.f_b74 = 0;
    data_021040ac.f_b78 = 0;
}
