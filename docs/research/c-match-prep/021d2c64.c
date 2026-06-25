/* CAMPAIGN-PREP candidate for func_021d2c64 (ov011, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     alloc+store accessor; but cross-overlay module:none BL = C-32 wall
 *   risk:       NOT C-expressible: the 0x021b5500 BL has no symbol; a C call becomes ldr+blx, wrong bytes. Must ship as .s (already exists).
 *   confidence: low
 */
/* func_ov011_021d2c64: alloc a 0x44/4 task via Task_PostLocked, run a
 * cross-overlay init, store the handle. WARNING: the second call is a
 * HARDCODED cross-overlay BL to 0x021b5500 emitted by dsd as
 * `module:none` with NO reloc (C-32 wall). mwcc cannot emit a fixed-
 * displacement `bl` to a raw address, so this CANNOT byte-match from C
 * and ships as src/overlay011/func_ov011_021d2c64.s (.word 0xebff8a1e).
 * C shown only as the structural intent. */
extern int Task_PostLocked(int size, int prio, int flags);
extern void func_021b5500(int handle);   /* unresolvable: module:none */
extern int *data_ov011_handle_slot;       /* r5 = arg0 ptr */

void func_ov011_021d2c64(int *slot) {
    int handle = Task_PostLocked(0x44, 4, 0);
    func_021b5500(handle);
    *slot = handle;
}
