/* CAMPAIGN-PREP candidate for func_021ca0ac (ov011, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     Sequential void calls; 2 cross-overlay bls + 2 intra
 *   risk:       WALL: cross-overlay bls to 021b0b44/021b2420 are hand-encoded `.word`; C `bl` cannot reach another overlay's swap addr -> ships as .s
 *   confidence: low
 */
/* func_ov011_021ca0ac: four sequential void calls. CROSS-OVERLAY BL WALL
 * (C-32): the first two targets (0x021b0b44, 0x021b2420) live in the
 * overlay-0/2 swap window, so the orig hand-encodes them as raw `.word` BLs
 * (0xebff9aa3 / 0xebffa0d9). A C `extern; call;` emits a relocatable BL that
 * mwldarm cannot retarget across overlays -> this cannot match in C; ship .s.
 * The intra-overlay tail (021cb25c, 021d18b0) is fine.
 *
 *   stmdb sp!, {r3, lr}
 *   .word 0xebff9aa3   ; bl 0x021b0b44 (cross-overlay)
 *   .word 0xebffa0d9   ; bl 0x021b2420 (cross-overlay)
 *   bl func_ov011_021cb25c
 *   bl func_ov011_021d18b0
 *   ldmia sp!, {r3, pc}
 */
extern void func_021b0b44(void);
extern void func_021b2420(void);
extern void func_ov011_021cb25c(void);
extern void func_ov011_021d18b0(void);

void func_ov011_021ca0ac(void) {
    func_021b0b44();
    func_021b2420();
    func_ov011_021cb25c();
    func_ov011_021d18b0();
}
