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
extern char data_ov004_022915e8[];   /* global lock flag (timer gate)         */
extern char data_ov004_0220e500[];   /* secondary state struct               */
extern char data_ov004_0220f228[];   /* f228 record array (stride 84)        */

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

/* =======================================================================
 * §VERIFIED — brief 318 wave 2 (15 picks, EUR ninja sha1 OK). Per-pick table in
 * docs/research/brief-318-ov004-clean-c-wave2.md.
 *
 * Families added:
 *  - id-latch sib 021da848; handle-free sib 021cfba0 (x3).
 *  - status-message: 021ceb24, 021d97c8, 021d9778, 021ce9e4, 021d9724
 *    (buf = 2-u16 local {tag, b500.field}; 02034888(3,buf,4); then
 *     func_02037208(ID, -1, 0, 1) -> mwcc emits `mov rX,#ID; sub rY,rX,#(ID+1)`,
 *     does NOT fold the -1. ids 66/58/56 confirmed.)
 *  - timer-setter 021d47bc/021d4958; struct-copy dispatch 021cc74c
 *    (Copy32(dst,src,n)/Fill32(val,dst,n) + guard-flip); state-machine 021d7c00;
 *    cell-config 021da898 (021ca0a4 6-arg).
 *
 * WALLS (defer; reg-alloc/permuter tail):
 *  - changed-bool family (~8: 021d48bc 021d52a0 021d4044 021d427c 021d43a0
 *    021d4d8c 021d4804 021d5a10): `int c=0; if(rec.unk38){rec.unk38=0;c=1;}
 *    if(c)...` — orig reuses the dead unk38 reg (r0) for c; mwcc picks fresh r1.
 *    1 reg off on every member; unsteerable (store-c, !!, temp all fail).
 *  - two-const message (021d1264/021d12b0/021d1308): buf-const + b500-field-const
 *    swap ip<->lr.
 *  - materialized-bool-global `if(g!=0)return` (021d4870/021d57ec): orig
 *    materialises movne#1;moveq#0, mwcc branches direct.
 *  - fn-ptr B6C dispatch (021cb518/021d6ed0): data_021040ac.B6C++ field-pool
 *    (== ov011 021d0afc wall). field-pool RMW 021cc2a4; base+212 pool 021d641c.
 * ======================================================================= */

/* =======================================================================
 * §VERIFIED — brief 320 wave 3 (6 picks, EUR ninja sha1 OK). EASY CLEAN TIER
 * THINNING (17->15->6). Per-pick table in brief-320-ov004-clean-c-wave3.md.
 *  - 021d3818 (MMIO/sound teardown), 021da91c (toggle + tail-call), 021cbf84
 *    (cell-config sib), 021d3d2c (sound+flag dispatch), 021d13dc/021cea48 (msg).
 *
 * Recipes: tail-call (void fn, last stmt func_X(), no frame -> `bx ip`; dcheck
 * normalises bx<reg>); a `mov r0,#0` before a dispatch branch is the callee ARG
 * (021d1118(0)); `-N` literal quirk works for any sink (0208e2f4(reg,28,-16) ->
 * mov;sub); re-read a field when orig reloads it (021cea48); cell-config base is
 * NOT cached when calls separate the accesses (021cbf84 vs 021da898 which is).
 *
 * NEW WALLS: loop strength-reduction (021d7854/021dab1c — mwcc keeps a separate
 * i*N counter vs orig inline `add base,i,lsl#k`); fn-ptr-by-field reg (021d5b14);
 * magic-/1000 division (021d3de4); stack-heavy sinks (021ca0a4/cb778/cb568).
 *
 * THINNING FLAG: the changed-bool family (~19) is the dominant remainder ->
 * PERMUTER PASS is the biggest unlock. Else clean-C ~6/wave, or pivot overlay.
 * The 0x100-0x200 ov004 tier is untouched.
 * ======================================================================= */

#endif /* OV004_CORE_H */
