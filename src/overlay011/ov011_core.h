/* ov011_core.h — STARTER SKETCH of the ov011 per-overlay vocabulary
 * (brief 308 wave 1, the clean-C drain that opened ov011 off the ov002
 * GLOBAL_ASM pivot). ov011 is the camera/view + actor-placement overlay:
 * a big BSS state struct plus a handful of helper sinks in main-arm9 and
 * ov000.
 *
 * The §VERIFIED block at the bottom is byte-proven (brief 308 wave 1 — 19
 * picks, EUR objdiff 100%). Entries ABOVE it are SKETCH — inferred from the
 * gap disassembly, not yet byte-verified field-by-field. Promote sketch
 * entries into VERIFIED as waves prove them, exactly like ov006_core.h.
 *
 * STYLE: like ov006, the reachable cohort mostly calls ALREADY-MATCHED
 * sinks (handle/actor accessors) + reads/writes fields of the dominant
 * state struct. Most files just `extern` the sink + the data base locally
 * and write the body; this header documents the shared vocabulary so wave 2
 * doesn't re-derive the offsets.
 */
#ifndef OV011_CORE_H
#define OV011_CORE_H

/* --- dominant data bases (declare `extern char foo[]`; gotcha 2: char[] so
 *     `base + off` is the address, no extra deref) ----------------------- */
extern char data_ov011_021d4000[];   /* primary camera/view state struct    */
extern char data_ov011_021d403c[];   /* secondary view state (parallel)     */
extern char data_ov011_021d4110[];   /* handle table, indexed [idx << 2]    */
extern char data_ov011_021d41a0[];   /* actor table, stride 0x14            */
extern char data_ov011_021d4660[];   /* parallel coord array X, stride 0x28  */
extern char data_ov011_021d4664[];   /* parallel coord array Y, stride 0x28  */
extern char data_ov011_021d4670[];   /* parallel coord array X', stride 0x28 */
extern char data_ov011_021d4674[];   /* parallel coord array Y', stride 0x28 */

/* --- data_ov011_021d4000 field map (byte offsets; § = byte-verified) ----
 *   +0x114 / +0x118  handle ptrs, freed via func_0207fd28(h, 0x1000)   §
 *   +0x174           handle ptr, guarded-freed                         §
 *   +0x238 / +0x23c  view origin x / y (fixed-point .12)
 *   +0x258..+0x270   prev / limit coords
 *   +0x2a0           mode word (0 / 1 switch discriminant)             §
 *   +0x2a4           packed: 4-bit field at bits 16:13                 §
 *   +0x2a8           blend field (low 16 bits cleared by 021ca600)
 *   +0x2ac           2-bit field at bits 19:18 (021cf0a4 reads it)     §
 *   +0x2b0           blend bitfield: bits 12:9 nibble, & 0xffe01fff     §
 *   +0x2bc           bit26 / bits 21:18 config field                   §
 * (data_ov011_021d403c mirrors many of these for the second view.)        */

/* --- shared sinks (already in the tree; `extern` from existing decls) ----
 *   func_0207fd28(handle, flags)        free/release a handle (flags 0x1000)
 *   func_0201e7e4/7ec/7f4/800/80c(h)    handle/cell-engine accessors
 *   func_0201e964 / func_0201eaa0(...)  cell-config sinks (stack-arg heavy)
 *   func_02018bc0(id)  -> actor*        resolve an actor record by id
 *   func_ov000_021ac538/560/72c/770/   actor-table element ops (stride 0x14)
 *            7a8/750/760/7c4(entry,...)
 *   GetSystemWork() -> u32*             NitroSDK system work area
 */

/* =======================================================================
 * §VERIFIED — brief 308 wave 1 (19 picks, EUR objdiff fuzzy 100%, compiled
 * under the build.ninja ov011 cflags / mwcc 2.0 sp1p5, byte-identical vs the
 * delinked gap .o). Per-pick table in
 * docs/research/brief-308-ov011-clean-c-wave1.md.
 *
 * Families that recur (clone targets for wave 2):
 *  - guarded handle-free:        021cc250, 021cc344  (func_0207fd28)
 *  - single-field RMW bitfield:  021cf2b8, 021cfaf8, 021cfb24
 *  - call-wrapper / forwarder:   021cdbac, 021cf1f8, 021d2d6c, 021cdc3c
 *  - guard + call sequence:      021cd638, 021d1b48
 *  - predicate (bitfield read):  021cf0a4
 *  - parallel-array store:       021d0f8c, 021d0fb0  (stride 0x28 siblings)
 *  - table lookup + forward:     021d1028, 021d1f9c
 *
 * WALL (do NOT grind): multi-field RMW *leaves* on data_ov011_021d4000 that
 * hold a mask constant or a second base across >=2 field RMWs. mwcc pools the
 * field ADDRESS into a register (instead of `[base, #off]`), shifting reg
 * allocation; no source phrasing recovers it (3 forms tried). Reverted
 * 021ca600 / 021ca630 / 021ccf3c. SINGLE-field RMW is fine.
 * ======================================================================= */

/* =======================================================================
 * §VERIFIED — brief 311 wave 2 (18 picks, EUR ninja sha1 OK). Per-pick table
 * in docs/research/brief-311-ov011-clean-c-wave2.md.
 *
 * New families (clone targets for wave 3):
 *  - 4660-slot id RMW + flag:   021d0ed0 (set), 021d0e88 (search loop)  [sib]
 *  - counted-loop init:         021d1884 (10×, stride 0x28), 021cc3d4 (5× +RMW)
 *  - block-copy switch:         021cc9b4 (2-case + 12B struct copy -> ldm/stm)
 *  - MMIO BG-scroll double:     021cc948 (0x04000010/14, guarded)
 *  - ||-with-embedded-assign:   021cb218 (cached base across calls)
 *  - 2-RMW split by calls:      021cff9c (each isolated -> single-field, fine)
 *
 * Recipe levers proven this wave (see brief 311 for detail):
 *  - struct-copy `*(blk3*)dst = *(blk3*)src` (3 ints) -> ldm/stm; sparse 2-case
 *    switch lowers to cmp/beq chain (NOT a jump table -> dodges layout wall).
 *  - cached `char *b = data_…;` holds the base callee-saved ACROSS calls/loops.
 *  - swap LOCAL DECLARATION ORDER to flip a clean 2-reg r4/r5 (ip/lr) swap.
 *  - `v=B; if(c) v=A;` (uncond default + 1 cond move) vs `v=c?A:B` (both cond).
 *  - byte extract via `(unsigned)(x<<24)>>24` (NOT (u8)x -> `and #255`).
 *
 * WALL additions (defer; GLOBAL_ASM/permuter tail):
 *  - field-address pooling on a POST-CALL single access: a lone RMW/`+=1` after
 *    a call fuses `base+off` into the pool instead of `[base,#off]`; cached-base
 *    does not recover it. (021ccf8c, 021cefb4, 021d0afc, 021d0b4c)
 *  - `(n<<K1)>>K2` nibble-reposition fuses to `& mask` (skips lsr;lsl). (021ceffc)
 *  - load-dest reg-numbering (r0 vs r1) clean 2-reg cascade. (021d20e8, 021d18b4)
 *  - arg-eval-order (right-to-left) reg cascade. (021cd700, 021ce344)
 * ======================================================================= */

#endif /* OV011_CORE_H */
