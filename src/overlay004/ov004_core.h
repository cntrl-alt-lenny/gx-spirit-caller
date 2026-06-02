/* ov004_core.h — STARTER SKETCH of the ov004 per-overlay vocabulary
 * (brief 316 wave 1, the clean-C pivot off the tapped ov011 drain). ov004 is a
 * large mixed ARM/THUMB overlay: the 0x021c9xxx-0x021cexxx range is ARM game
 * logic over a dominant BSS state struct; the 0x021dbxxx-0x021dexxx range is
 * THUMB utility code (string/crypto helpers) that hits the Thumb
 * section-alignment wall -> .s escape, NOT clean-C (see thumb-align-wall.md).
 *
 * The §VERIFIED block at the bottom is byte-proven; entries above are SKETCH.
 * STYLE like ov011: most files just `extern` the sink + data base locally and
 * write the body; this header documents the shared bases so the wave doesn't
 * re-derive offsets. GATE = 3-region ninja sha1 (NOT ninja check — ov004 has a
 * benign dsd data-label drift, brief 818).
 */
#ifndef OV004_CORE_H
#define OV004_CORE_H

/* --- dominant data bases (extern char foo[]; base+off is the address) ----- */
extern char data_ov004_0220b500[];   /* primary BSS state struct             */
extern char data_ov004_0220b568[];   /* parallel table, indexed [idx << 2]   */
extern char data_ov004_02211490[];   /* record A (init/reset target)         */
extern char data_ov004_02211538[];   /* record B (init target)               */

/* --- data_ov004_0220b500 field map (byte offsets; § = byte-verified) ------
 *   +0x84    current-id latch (set-if-changed, then func_021c9ef0(id+219))  §
 *   +0x228   active flag (!=0 gate)                                          §
 *   +0x230   mode word (== 3 check)                                         §
 *   +0x68    per-index signed field at [base + idx*4 + 0x68]                §
 */

/* --- shared sinks (extern from existing decls) ----------------------------
 *   func_0202c0c0(id) -> int            sound/se trigger (also ov011)
 *   func_ov004_021c9ef0(id)             id-change handler
 */

/* =======================================================================
 * §VERIFIED — brief 316 wave 1 (17 picks, EUR ninja sha1 OK). Per-pick table in
 * docs/research/brief-316-ov004-clean-c-wave1.md.
 *
 * Families (clone targets for wave 2):
 *  - b500 global predicate/accessor: 021cbf38, 021ce9b8, 021d7c54, 021d9948,
 *    021ce1bc  (ALL need cached `char *b = data_ov004_0220b500;` — bare access
 *    reg-numbers the base r1 vs orig r2).
 *  - self-ptr record op: 021c9f94 (handle-free x2), 021d56fc (timer advance).
 *  - timer-setter (double-ternary): 021d4004, 021d4238, 021d4914 [sib].
 *  - forwarder/sequence: 021d2520, 021c9d60, 021c9d9c, 021cf600, 021d8608,
 *    021d5b9c.  MMIO: 021d5d84 (0x0500045e backdrop grayscale).
 *
 * GOTCHAS (ov004-specific):
 *  - cached-base mandatory for global accessors (021c9d60, no global, matched raw).
 *  - guard-flip block layout: `if(active) return cmp; return 0;` (021d9948).
 *  - m2c_feed MISLABELS main-arm9 data syms with the ov004 prefix: a 0x0210xxxx
 *    sym shows as data_ov004_02104f4c but the real name is data_02104f4c (no
 *    prefix) -> else mwldarm Undefined. Use the bare data_0210xxxx name.
 *  - objdump offsets are DECIMAL (132=0x84, 136=0x88, 84=0x54).
 *  - THUMB cohort (021dbxxx generic utils) = Thumb-align wall -> .s escape, NOT
 *    clean-C. This header/track is the ARM cohort only.
 *
 * WALL: 021d8d1c (MMIO BLDCNT bitfield RMW — orig uses ip scratch for field>>8,
 * mwcc reuses r2; 1 reg off).
 * ======================================================================= */

#endif /* OV004_CORE_H */
