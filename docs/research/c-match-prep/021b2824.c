/* CAMPAIGN-PREP candidate for func_021b2824 (ov016, class B) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     DISPATCH fn-ptr-table + counter; bind-vs-reload
 *   risk:       data_021b9740 reloaded post-blx (separate ldr); fn-ptr elem type and counter-struct layout guessed; same shape as 26ec
 *   confidence: med
 */
/* func_ov016_021b2824: identical clone of the 26d0 dispatch+counter.
 *   idx = *gIdx; fn = gTable[idx];
 *   if (!fn) return 1;
 *   if (fn()) { (*gIdx)++; gIdx[1] = 0; }
 *   return 0;
 * The asm RELOADS data_021b9740 after the blx, so reference it twice. */

typedef int (*StateFn)(void);

extern int     data_ov016_021b9740;     /* current index (int) */
extern StateFn data_ov016_021b8f80[];   /* fn-ptr table, stride 4 */

int func_ov016_021b2824(void) {
    StateFn fn = data_ov016_021b8f80[data_ov016_021b9740];
    if (fn == 0) return 1;
    if (fn() != 0) {
        ((int *)&data_ov016_021b9740)[0] += 1;
        ((int *)&data_ov016_021b9740)[1] = 0;
    }
    return 0;
}
