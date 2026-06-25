/* CAMPAIGN-PREP candidate for func_021b26ec (ov014, class B) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     DISPATCH fn-ptr-table + counter; bind-vs-reload
 *   risk:       data_021b5040 reloaded (asm re-ldr's it post-blx); fn-ptr table elem type / counter-struct layout guessed
 *   confidence: med
 */
/* func_ov014_021b26ec: tick the active state's per-frame handler.
 *   idx = *gStateIndex; fn = gStateTable[idx];
 *   if (!fn) return 1;          // no handler -> 'done'
 *   if (fn()) { (*gStateIndex)++; gStateIndex[1] = 0; }  // advanced
 *   return 0;
 * Identical clone of the 26d0 dispatch+counter shape. The asm RELOADS
 * data_021b5040 after the blx (separate ldr), so reference it twice. */

typedef int (*StateFn)(void);

extern int            data_ov014_021b5040;   /* current state index (int) */
extern StateFn        data_ov014_021b4cc0[]; /* fn-ptr table, stride 4 */

int func_ov014_021b26ec(void) {
    StateFn fn = data_ov014_021b4cc0[data_ov014_021b5040];
    if (fn == 0) return 1;
    if (fn() != 0) {
        ((int *)&data_ov014_021b5040)[0] += 1;
        ((int *)&data_ov014_021b5040)[1] = 0;
    }
    return 0;
}
