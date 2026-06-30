/* CAMPAIGN-PREP candidate for func_02082044 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     ACCESSOR (u16) + shift-left-3
 *   risk:       Offset 0x1c via u16 index assumes packed struct; ldrh sign is unsigned — confirm field width.
 *   confidence: high
 */
/* func_02082044: u16 field at 0x1c, returned <<3. */
int func_02082044(const unsigned short *p) {
    return (int)p[0x1c / 2] << 3;
}
