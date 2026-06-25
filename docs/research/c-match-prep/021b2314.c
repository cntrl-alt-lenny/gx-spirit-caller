/* CAMPAIGN-PREP candidate for func_021b2314 (ov023, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     blx fn-pointer-table dispatch + post-call reload + counter bump/clear
 *   risk:       scheduling: mov #0 (f4) may not hoist above the index++ RMW load; literal-pool order (b23a0 before b2380) may flip
 *   confidence: med
 */
/* func_ov023_021b2314: dispatch fn_table[ctrl.index]; if null return 1.
 * Call it; if it returns nonzero, bump ctrl.index and clear ctrl.f4. Return 0.
 * (blx function-pointer-table recipe; global base reloaded after blx.) */
typedef int (*fn_ov023_2314_t)(void);

extern fn_ov023_2314_t data_ov023_021b2380[];
extern struct { int index; int f4; } data_ov023_021b23a0;

int func_ov023_021b2314(void) {
    fn_ov023_2314_t f = data_ov023_021b2380[data_ov023_021b23a0.index];
    if (f == 0) return 1;
    if (f() != 0) {
        data_ov023_021b23a0.index++;
        data_ov023_021b23a0.f4 = 0;
    }
    return 0;
}
