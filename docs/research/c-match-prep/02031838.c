/* CAMPAIGN-PREP candidate for func_02031838 (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     CLASS D: dense 6-case switch-returning-constants -> jump-table + shared base
 *   risk:       orig hoists base 0x164a once then `add r0,r0,#0x12..0x17` per case; if mwcc materializes each return constant independently (6 ldr/mov) the case bodies diverge. reshape-able by keeping returns as base+delta-foldable literals.
 *   confidence: med
 */
/* CAMPAIGN-PREP candidate for func_02031838 (main, class D, MED tier).
 * UNVERIFIED + ITERATION-EXPECTED. Dense 6-case switch returning constants,
 * lowered to a jump-table: idx = x - 0x164a; if idx in [0,5] return
 * 0x164a + (0x12+idx) else 0. mwcc hoisted the shared base 0x164a into one
 * `ldr r0,_LIT0` BEFORE the switch and emits `add r0,r0,#delta` per case
 * (it saw every return value as base+delta). Writing the cases as the full
 * constants lets mwcc rediscover the common base.
 *   recipe:     CLASS D: dense switch returning constants -> branch-table.
 * map: 0x164a->0x165c .. 0x164f->0x1661 (each = 0x164a + 0x12..0x17).
 */
int func_02031838(int x) {
    switch (x) {
    case 0x164a: return 0x165c;
    case 0x164b: return 0x165d;
    case 0x164c: return 0x165e;
    case 0x164d: return 0x165f;
    case 0x164e: return 0x1660;
    case 0x164f: return 0x1661;
    default:     return 0;
    }
}
