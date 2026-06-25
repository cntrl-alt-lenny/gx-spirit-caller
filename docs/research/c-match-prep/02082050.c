/* CAMPAIGN-PREP candidate for func_02082050 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     ACCESSOR (u16) + shift-left-3
 *   risk:       Offset 0xc via u16 index assumes packed struct; unsigned halfword — confirm field width.
 *   confidence: high
 */
/* func_02082050: u16 field at 0xc, returned <<3. */
int func_02082050(const unsigned short *p) {
    return (int)p[0xc / 2] << 3;
}
