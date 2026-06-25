/* CAMPAIGN-PREP candidate for func_021aafa4 (ov008, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     Indirect blx dispatcher + BIND-vs-RELOAD global + store pair
 *   risk:       global data_021040ac is RELOADED after blx (separate refs) — over-binding to one local would mismatch; +0xb6c index and the two strh offsets confirmed
 *   confidence: med
 */
/* func_ov006_021aafa4: dispatch table walk.
 *   idx = (*data_021040ac)[0xb6c]; fn = data_ov008_021b2440[idx];
 *   if (!fn) return 1;
 *   if (!fn()) return 0;
 *   data_ov008_021b2780[1] = 0; data_ov008_021b2780[2] = 0;  (shorts at +2,+4)
 *   (*data_021040ac)[0xb6c]++;   (global RELOADED here, not held)
 *   return 0;
 */

extern int   data_021040ac[];
extern int   data_ov008_021b2440[];
extern short data_ov008_021b2780[];

int func_ov008_021aafa4(void) {
    int idx = data_021040ac[0xb6c / 4];
    int (*fn)(void) = (int (*)(void))data_ov008_021b2440[idx];
    if (fn == 0) return 1;
    if (fn() == 0) return 0;
    data_ov008_021b2780[1] = 0;
    data_ov008_021b2780[2] = 0;
    data_021040ac[0xb6c / 4] = data_021040ac[0xb6c / 4] + 1;
    return 0;
}
