/* CAMPAIGN-PREP candidate for func_0209bf18 (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     D: nested mla (h*60+m)*60+s; addend loaded first (acc-first)
 *   risk:       orig loads [r0,#4](min) before [r0,#0](hour) so the mla addend is in the dest reg first; if mwcc loads hour first the two ldr swap order. reshape-able (write 't[1] + t[0]*60' to force min-first).
 *   confidence: high
 */
/* CAMPAIGN-PREP candidate for func_0209bf18 (main, class D, MED tier).
 * UNVERIFIED but HIGH for this batch: tiny double-mla, no real divmod.
 *   recipe:     two nested mla; load addend (min) before multiplicand (hour) to match mla accumulator-first
 *   risk:       orig loads [r0,#4] (min) BEFORE [r0,#0] (hour) -> mla acc-first; writing hour*60+min should place the addend in the dest reg first; if mwcc loads hour first the two ldr swap. reshape-able (write min + hour*60, or reorder field refs).
 *   confidence: high
 */
/* func_0209bf18: time {int hour(+0), int min(+4), int sec(+8)} -> total seconds
 * of day = (hour*60 + min)*60 + sec. */

int func_0209bf18(int *t) {
    return (t[0] * 60 + t[1]) * 60 + t[2];
}
