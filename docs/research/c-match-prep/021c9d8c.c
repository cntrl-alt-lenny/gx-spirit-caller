/* CAMPAIGN-PREP candidate for func_021c9d8c (ov012, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     tail/seq trampoline; but 2x cross-overlay module:none BL = C-32 wall
 *   risk:       NOT C-expressible: the two raw-address BLs have no symbols; C calls become ldr+blx, wrong bytes. Must ship as .s (already exists).
 *   confidence: low
 */
/* func_ov012_021c9d8c: trampoline of three BLs. Two are HARDCODED
 * cross-overlay calls to 0x021b0b44 and 0x021b2420 emitted as
 * `module:none` (C-32 wall) — mwcc cannot produce fixed-displacement
 * `bl`s to raw addresses, so this CANNOT byte-match from C and ships as
 * src/overlay012/func_ov012_021c9d8c.s (.word 0xebff9b6b/0xebffa1a1).
 * C shown only as structural intent. */
extern void func_021b0b44(void);   /* unresolvable: module:none */
extern void func_021b2420(void);   /* unresolvable: module:none */
extern void func_ov012_021ca6dc(void);

void func_ov012_021c9d8c(void) {
    func_021b0b44();
    func_021b2420();
    func_ov012_021ca6dc();
}
