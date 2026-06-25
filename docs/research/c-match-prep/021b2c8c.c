/* CAMPAIGN-PREP candidate for func_021b2c8c (ov017, class B) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     fn-ptr-table dispatch via global index + counter bump
 *   risk:       reload-vs-bind of the counter global after blx, and the two pool .word order, may flip
 *   confidence: high
 */
/* func_ov017_021b2c8c: run the current step from the function-pointer table
 * data_ov017_021b8020 indexed by the step counter data_ov017_021b8520[0].
 * Empty slot -> return 1 (done). Step returns non-zero -> advance the counter
 * and clear the [1] sub-state; return 0 either way the step ran.
 * (clone of 021b26d0 / the 26d0 dispatch+counter family.)
 */

extern int data_ov017_021b8520[];          /* [0]=step index, [1]=sub-state */
extern int (*data_ov017_021b8020[])(void); /* step function table */

int func_ov017_021b2c8c(void) {
    int (*step)(void) = data_ov017_021b8020[data_ov017_021b8520[0]];
    if (step == 0) {
        return 1;
    }
    if (step() != 0) {
        data_ov017_021b8520[0]++;
        data_ov017_021b8520[1] = 0;
    }
    return 0;
}
