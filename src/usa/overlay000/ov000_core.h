/* ov000_core.h — ov000 per-overlay vocabulary (brief 317, co-drain wave 1).
 *
 * The scaffolder's second drain stream pivoted to ov000 (ov006 mined out,
 * brief 314). Collision-free vs the decomper (on ov004). Every entry below is
 * byte-PROVEN: compiled under the build.ninja ov000 cflags and byte-compared
 * vs the delinked gap .o (direct-mwcc; bl/pool reloc modulo). Per-pick gate =
 * EUR objdiff 100%; the brain runs the 3-region SHA1 on merge.
 *
 * ⚠️ ov000 shares a base address with ov002 (overlay-swap; CLAUDE.md). Checked
 * this wave: NO ov000-unmatched func sits at an ov002 func address, and no
 * dotted/alias symbols in ov000 symbols.txt — gotcha 18 does not bite the
 * current cohort. BUT a few callees are dsd placeholders `func_ov000_…_unk`
 * (e.g. 021b0b38_unk, 021b11d0_unk): those are the overlay-overlap-zone
 * cross-calls — extern + bl-reloc still matches, but flag if one needs a body.
 */
#ifndef OV000_CORE_H
#define OV000_CORE_H

typedef unsigned char  u8;
typedef unsigned short u16;
typedef unsigned int   u32;

/* --- dominant globals (byte-proven offsets) ---------------------------- */

/* The "active object" pointer: *data_ov000_021c7300 is an int* to a big struct.
 * Proven fields (int indices): [9] flags, [12..14] live (x,y,z), [33..35] prev
 * snapshot, [54..56] delta, [72] derived; a u16 status at byte +0x13e (318).
 * Used by 021aa898 / 021aaa58 / 021aa9cc (the set-object-params family).      */
extern char data_ov000_021c7300[];   /* int** -> active object */

/* Big config struct (byte offsets): +0x1ac(428) active flag, +0x20c(524),
 * +0x2a4(676) mode-bits word (mask 0x807fffff, set bit23/bit25), +0x2a8(680),
 * +0x2ac(684), +0x2b0(688) packed config. Used by 021adb9c/af420/af3f0/adb70. */
extern char data_ov000_021c74ac[];
extern char data_ov000_021c74e4[];   /* parallel config: +0x174(372) callback fp, +0x264(612) base */
extern char data_ov000_021c7690[];   /* a subsystem-state flag (021aecf8) */

/* --- stride-44 row array (021c7530) — BITFIELD family, DEFERRED ---------
 * data_ov000_021c7450 is an array of 44-byte rows; the accessors do byte /
 * sub-byte bitfield inserts at +8 / +12 (021ab4bc |=, 021ab4ec &=~, 021ab520,
 * 021ab5ac, 021ab688, 021ab564, …). NEAR-MISS this wave: an 8-bit bitfield
 * write models as `row[idx].b12 |= v` and reaches 12v12 byte-for-byte EXCEPT
 * the `bic`/`and` pair is emitted in the opposite order (mwcc bitfield-insert
 * scheduling) — a 2-instruction swap that did not flip from C. Likely needs a
 * different mwcc sub-rev or ship-as-.s. Bank as a wave-2 target.              */
struct Ov000Row { char pad0[12]; unsigned b12 : 8; unsigned : 24; char pad16[28]; };  /* stride 44 */
extern struct Ov000Row data_ov000_021c7450[];

/* --- main-arm9 sinks the reachable cohort leans on (extern, already named) -
 * func_0201d530 (VRAM offset by mode), func_02094504 (VRAM clear), func_0201d4b4,
 * func_0201ef3c (flush deferred), func_02001e5c (idle query), func_0208bfc4,
 * func_021aa7e0/_021aa5b8/_021aa8d4 (object helpers), func_021ac7dc, func_021ad464. */

/* ====================================================================== *
 *  §VERIFIED — co-drain wave 2 (brief 319). 13 more .c, all EUR objdiff   *
 *  100% + dropped from a clean ov000 re-delink + EUR `ninja sha1` OK.     *
 *  ov000 matched .c: 23 -> 36. NOT thinning: wave 2 (13) beat wave 1 (11) *
 *  once these recipes were in hand.                                       *
 * ====================================================================== */

/* More proven fields (byte offsets, decimal):
 *  - *021c73e0 active object: signed 4-bit facing field at +320 (021aa840/
 *    021aa7e0); a (dx,dy,z) short triple at +0x24 & +0x30 (021aaa20); u16
 *    status at +318 (021aa7e0, written 0xffff).
 *  - 021c758c config: two signed 4-bit nibbles packed in the low byte of word
 *    +4 (021ac834); the +676 mode word also carries a 4-bit facing sub-field
 *    in bits[3:0] (021ae654).
 *  - 021c75c4 config: 8-bit field at bit23 of +620, +628 bit0 RMW, +368
 *    callback fp (021ad3e8/021af378); 021c7594 +44 8-bit field (021af47c).
 *  - Display MMIO: regs +0x00 (3-bit field [15:13], 021ab474) and +0x50
 *    (bits[7:6], 021ab850 near-miss) of engines 0x04000000 / 0x04001000.       */

/* Sinks recovered this wave (signatures byte-proven via the call sites):
 *  - func_02037208(int id, int a1, int a2, int a3)  status/notify; a1 conv. -1
 *    (mwcc derives -1 as (56-57) reusing the id reg). (021ae654, 021ae218.)
 *  - func_0207f884(void*) / func_0207f85c(void*)    scratch-record init.
 *  - int func_0201ef10(int)                          maps a 5-bit field.
 *  - func_0201ee1c(int,int,int,void*,int)            5-arg (5th on the stack).
 *  - Task_InvokeLocked(int)                          locked-task dispatch.
 *    (the five above: orchestrator 021aca28.)                                 */

/* Recipes banked (wave 2) — the levers that turned near-misses into matches:
 *  1. OFFSET-MEMBER not pointer-cast: to get `ldr [base,#off]` (orig pools the
 *     base symbol), read a field as a struct MEMBER at that offset
 *     (`((struct{char pad[N];T f;}*)base)->f`), NOT `*(T*)(base+N)` — the
 *     latter folds N into the pool constant + uses offset 0. (021ac834.)
 *  2. UNSIGNED bitfield -> lsr, signed -> asr. A lone asr/lsr near-miss on a
 *     field read is just the field's signedness. (021abfec, 021ae654, 021aca28.)
 *  3. POSITIVE-CONSTANT pool vs mvn: `f = 0xffff` to a SIGNED short collapses
 *     to `mvn,#0`; to an UNSIGNED field mwcc pools 0x0000ffff. (021aa7e0.)
 *  4. `switch` PREVENTS TAIL-MERGE: identical-body if/else branches get
 *     tail-merged + tail-called (selector read dropped); a switch keeps the
 *     selector read + duplicated bodies + the frame. (021ae654.)
 *  5. CHAINED-ADDRESS struct: when the orig computes addr2 = addr1 + k, model
 *     both stores as fields of ONE struct based at the lower addr. (021aaa20.)
 *  6. 5-ARG STACK LAYOUT: arg5 lands at sp+0 (outgoing area, bottom); locals
 *     stack above, last-declared lowest. (021aca28: a[36] then b[20] ->
 *     b@sp+4, a@sp+24.)
 *  7. (short) CAST forces a dead lsl#16;asr#16 before a 4-bit bitfield write
 *     that a `short` param would skip. (021aa7e0.)
 *  8. 16-bit bitfield RMW (`unsigned c:16; unsigned:16`): `if(c)c--` / `c+=b`
 *     emit the load/mask/recombine (mask 0xffff0000 via mov+rsb). (021abfbc,
 *     021abfec.)                                                              */

/* Walls re-confirmed (defer to .s or a dedicated wave-3 RE pass):
 *  - stride-44 bitfield-PACK family (021c7530 + the 021c7588/758c region packs
 *    021ab5d8/62c/aed38/af560/ab6ec/ab740): multi-field bic/and/orr insert
 *    order — ship-as-.s territory (see Ov000Row above).
 *  - 021ab850 reg-numbering near-miss: 25v25, structurally perfect, but the
 *    allocator puts the loaded value in r0 / the ptr in r1 and won't reorder.
 *  - 021aa840 CSE near-miss: 21v22, mwcc hoists the obj+256 base the orig
 *    recomputes per branch.
 *  - 021ae218 / 021adc50: complex orchestrators (nested goto-tail control
 *    flow / many-stack-arg calls) — dedicated RE.                            */

/* ====================================================================== *
 *  §VERIFIED — co-drain wave 3 (brief 321). 3 more .c, all EUR objdiff    *
 *  100% + clean re-delink drop-out + EUR `ninja sha1` OK. 36 -> 39.        *
 *  THINNING CONFIRMED: clean-C yield 11 (w1) -> 13 (w2) -> 3 (w3). The     *
 *  easy read/predicate/RMW shapes are mined; the residue is fixed-point    *
 *  math, multi-field PACKs, and big command-record builders.               *
 * ====================================================================== */

/* The 3 picks:
 *  - 021ac050 saturating-subtract u16 clamp (sibling of 021abfbc/abfec).
 *  - 021ad540 + 021ad49c OBJECT-BUILDER clone pair (the wave-2 "021ad540
 *    dedicated-RE" item — matched FIRST TRY once modeled). Differ only in
 *    the object table + two window-size constants.                          */

/* OBJECT-BUILDER family template (021ad540/021ad49c; 021ac920 2-byte near):
 *   obj = table[idx];                       // ldr r5,[tableptr, idx<<2]
 *   if (a1 != -1) func_0201e800(obj, (unsigned short)a1);
 *   func_0201e964(1, obj->f44, a4, 0, 0, 0, a3, a2, WIN_W, WIN_H, a5, 0);
 *   if (a1 == -1) { func_0201e7ec(obj,1); func_0207fd28(obj,4096); }
 * Sinks recovered: func_0201e800(void*,int) re-init; func_0201e964(...12 args,
 * 4 reg + 8 stack) window build; func_0201e7ec(void*,int); func_0207fd28(
 * void*,int) free; tables data_ov000_021c752c[] / 021c7604[] (stride-4 obj
 * ptr arrays). 12-arg call: args 4..11 at sp+0..28; the 5th-incoming-arg is
 * read at [sp+56] (after push of 6 regs + sub sp,#32). See 021aca28 recipe 6. */

/* Wave-3 walls / near-misses (permuter or dedicated-RE / .s — NOT co-drain):
 *  - 021ac920 (0x108 guarded builder): 66v66, byte-identical EXCEPT the entry
 *    guard loads obj->f104 into r0 (mine) vs r3 (orig) — pure reg-numbering,
 *    PERMUTER-TRIVIAL. Needs `volatile` flags to stop mwcc caching the +152
 *    word in a callee-saved reg (orig re-reads each use). Recovers sinks
 *    0201ef90 (10-arg) / 0201ef10 / 0201e7e0 / 0201ede4 when landed.
 *  - 021abf78 u16 clamp: 17v17 reg-numbering (byte->r2 vs r1), won't flip.
 *  - 021acdcc: 17v18, mwcc drops the redundant `and #0xff` the orig keeps
 *    before the 8-bit-field-at-bit8 insert (bitfield-insert codegen).
 *  - 021ae42c: bx-ip POOLED tail-call (orig pools the far 021ae510); the
 *    standalone direct-mwcc compile emits bl+frame — a link-layout artifact,
 *    not reproducible here (matches once linked / via the brain on merge).
 *  - Fixed-point (smull/mla) class: 021ae510, 021ab01c, 021aaee4, 021aa8d4,
 *    021ac578 (distance test), 021acc58 — m2c/permuter territory.
 *  - command-record builders: 021ad660/021ad8dc (0x27c clone pair, dual record
 *    + MMIO + packs), 021abd50, 021af5e0 — dedicated RE.                     */

/* §VERIFIED — brief 403 route-w1: 021ac920 (the object-builder 2-byte near-
 * miss above) re-diagnosed fresh = the entry param-save/first-load interleave
 * (`ldr r3,[r6,#104]` scheduled between the `mov r6,r0` and `mov r5,r1` saves)
 * — scheduling-interleave class, NOT const-mat → shipped whole-function .s
 * (kind:data-clean, asm_escape byte-identical, link-proven, 3-region sha1). */

#endif /* OV000_CORE_H */
