/* CAMPAIGN-PREP candidate for func_021c9d60 (ov013, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     tail/seq trampoline; but 2x cross-overlay module:none BL = C-32 wall
 *   risk:       NOT C-expressible: the two raw-address BLs have no symbols; C calls become ldr+blx, wrong bytes. Must ship as .s (already exists).
 *   confidence: low
 */
/* func_ov013_021c9d60: trampoline of three BLs. Two are HARDCODED
 * cross-overlay calls to 0x021b0b44 and 0x021b2420 emitted as
 * `module:none` (C-32 wall) — not byte-expressible in C; ships as
 * src/overlay013/func_ov013_021c9d60.s (.word 0xebff9b76/0xebffa1ac).
 * C shown only as structural intent. */
extern void func_021b0b44(void);   /* unresolvable: module:none */
extern void func_021b2420(void);   /* unresolvable: module:none */
extern void func_ov013_021ca024(void);

void func_ov013_021c9d60(void) {
    func_021b0b44();
    func_021b2420();
    func_ov013_021ca024();
}
