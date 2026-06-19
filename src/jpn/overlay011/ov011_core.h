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
extern char data_ov011_021d3f20[];   /* primary camera/view state struct    */
extern char data_ov011_021d3f5c[];   /* secondary view state (parallel)     */
extern char data_ov011_021d4030[];   /* handle table, indexed [idx << 2]    */
extern char data_ov011_021d40c0[];   /* actor table, stride 0x14            */
extern char data_ov011_021d4580[];   /* parallel coord array X, stride 0x28  */
extern char data_ov011_021d4584[];   /* parallel coord array Y, stride 0x28  */
extern char data_ov011_021d4590[];   /* parallel coord array X', stride 0x28 */
extern char data_ov011_021d4594[];   /* parallel coord array Y', stride 0x28 */

/* --- data_ov011_021d3f20 field map (byte offsets; § = byte-verified) ----
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
 * (data_ov011_021d3f5c mirrors many of these for the second view.)        */

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
 * WALL (do NOT grind): multi-field RMW *leaves* on data_ov011_021d3f20 that
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

/* =======================================================================
 * §VERIFIED — brief 313 wave 3 (12 picks, EUR ninja sha1 OK; the hard tail).
 * Per-pick table in docs/research/brief-313-ov011-clean-c-wave3.md.
 *
 * CELL-CONFIG SINK FAMILIES cracked (the headline lever — these sinks are
 * stack-arg-heavy with NO prior C convention; reconstruct from the frame:
 * r0-r3 = args 1-4, sp[0],sp[4],… = args 5+, locals sit ABOVE the outgoing-arg
 * area; mwcc emits `stmib` for the consecutive arg stores):
 *  - func_0201e964(mode, h->unk2C, &cfg, 0, …8 stack ints): 021cc8bc, 021cc424,
 *    021cc5c4  [arg2 is h->unk2C; cfg = 2-int local OR an incoming pointer]
 *  - func_0201eaa0(mode, h, p5, sub, …): 021cbb64  [arg2 is h itself]
 *  - func_0201ef90(&f0, &f1, &f2, 0x6800, …, &data_3138[(arg0-1)*16], …):
 *    021cd048  [address-of-field args: `s + 0xBC` -> `add r0,r4,#188`]
 * Handle tables: 021d4110/4120/4140/4154/4174 and ov000 021c75cc, indexed
 * [idx<<2]; h->unk2C at +0x2C; release via func_0207fd28(h, 0x1000).
 *
 * Recipe levers proven this wave:
 *  - for(;;){ if(!cond) break; … } defeats mwcc while-loop ROTATION (top-test
 *    preserved, no peeled+duplicated tail). (021d0c38)
 *  - switch over {0,1} with NO default leaves the temp uninitialised — the orig
 *    uses the stale register on the default path. (021ca324)
 *  - guard-flip block layout: write `if (hot){ …; return; } cold();` so the cold
 *    path lands last (matches orig bne-to-end), NOT `if(!hot){cold;return;}`. (021cad00)
 *  - (reconfirmed) cached-base across calls/loops (021cb500/021d0c38);
 *    declaration-order reg-flip i-before-ptr (021cf228).
 *
 * WALL additions (defer; GLOBAL_ASM/permuter tail — ov011 has reached the ov002
 * brief-305 inflection: the reachable <0x100 cohort is now hard-tail only):
 *  - load-/mul-dest reg-numbering 2-reg swap (021d0bb0, 021d1080/1110).
 *  - stmib-grouping scheduling on the 8-param eaa0 variants — the extra
 *    p7&0xFFFF arg splits the 3rd store out. (021cc194, 021cc27c, 021cd0dc)
 *  - table-walk base-selection + count reload (32d8/334a stride 114): 021cd190,
 *    021cd1fc, 021cd268.
 *  - predication-vs-branch on dual-assignment if/else (021ceebc); dense
 *    jump-table layout (021d1f04); idx-N constant fold (021cd574); duplicated/
 *    no-op-mask logic (021d2008); overlay-swap unnamed bl targets (021ca0ac).
 * ======================================================================= */

/* =======================================================================
 * §VERIFIED — brief 315 wave 4 (2 picks, EUR ninja sha1 OK). ***ov011 clean-C
 * is TAPPED*** — see docs/research/brief-315-ov011-clean-c-wave4.md.
 *  - 021ccad8: view-mode-3 coord-change detector (021d1080 out-param + RMW).
 *  - 021caafc: coord classification readback (021ca400 + dual 305f/3178 table).
 *
 * Recipe banked: mwcc's signed `/4096` is `asr #11; add ..,lsr #20; asr #12`
 * (i.e. `(x + ((x>>11)>>>20)) >> 12`) — write the plain `expr / 4096` (021cc814,
 * which 1-reg-walled on an unrelated load-dest).
 *
 * STATUS: the reachable <0x100 cohort is down to 6 (2 shipped here, 4 walled:
 * 021cc814 load-dest 1-reg, 021cd2d4 multi-table, 021cfa50 field-pool, 021cca04
 * fold+predication+alloc). The 0x100-0x200 tier (13 funcs) is all large
 * composites (jump tables, state machines, value-maps, accumulation loops,
 * fixed-point render) — GLOBAL_ASM/permuter territory. WAVE 5 SHOULD PIVOT to a
 * fresh overlay: ov004 (168 <0x100 / 39 <0x40, richest) > ov000 (65/17) >
 * ov008 (49/4). The cell-config / cached-base / guard-flip recipes carry over.
 * ======================================================================= */

#endif /* OV011_CORE_H */
