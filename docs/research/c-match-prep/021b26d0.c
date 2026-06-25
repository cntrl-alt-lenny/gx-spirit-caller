/* CAMPAIGN-PREP candidate for func_021b26d0 (ov019, class B) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     fn-ptr-table dispatch via global index + counter bump
 *   risk:       reload-vs-bind of the counter global after blx, and the two pool .word order, may flip
 *   confidence: high
 */
/* func_ov019_021b26d0: run the current step from the function-pointer table
 * data_ov019_021b5b20 indexed by the step counter data_ov019_021b5e20[0].
 * Empty slot -> return 1 (done). Step returns non-zero -> advance the counter
 * and clear the [1] sub-state; return 0 either way the step ran.
 */

extern int data_ov019_021b5e20[];          /* [0]=step index, [1]=sub-state */
extern int (*data_ov019_021b5b20[])(void); /* step function table */

int func_ov019_021b26d0(void) {
    int (*step)(void) = data_ov019_021b5b20[data_ov019_021b5e20[0]];
    if (step == 0) {
        return 1;
    }
    if (step() != 0) {
        data_ov019_021b5e20[0]++;
        data_ov019_021b5e20[1] = 0;
    }
    return 0;
}
