/* CAMPAIGN-PREP candidate for func_021afaf0 (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     result=1 first (default before load); (unsigned)(v-0x47)<=1 range-opt; movcs clamp
 *   risk:       permuter-class (range-opt soft-wall): mwcc may re-fold the nested signed cmp chain (sublt/movcs at L_38/4c/5c) into a different branch layout or cond-code set; logic correct but the cmp/cond-select structure resists C-form steering.
 *   confidence: low
 */
/* func_ov002_021afaf0: classify/clamp data_ov002_022cdc78[1] (v) into a band
 * index, clamped to data_ov002_022cdc78[3]. v<=5 -> 0; v==0x26 or v in
 * {0x47,0x48} -> the max field; else piecewise (v-6) / 1 / (v-0x27), then
 * an unsigned clamp to the max field. */

extern int data_ov002_022cdc78[];

int func_ov002_021afaf0(void) {
    int result = 1;
    int v = data_ov002_022cdc78[1];
    int max;
    if (v <= 5) return 0;
    if (v == 0x26 || (unsigned int)(v - 0x47) <= 1)
        return data_ov002_022cdc78[3];
    if (v > 6 && v < 0x26) result = v - 6;
    else if (v > 0x27 && v < 0x47) result = v - 0x27;
    max = data_ov002_022cdc78[3];
    if ((unsigned int)result >= (unsigned int)max) result = max;
    return result;
}
