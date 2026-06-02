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

/* The "active object" pointer: *data_ov000_021c73e0 is an int* to a big struct.
 * Proven fields (int indices): [9] flags, [12..14] live (x,y,z), [33..35] prev
 * snapshot, [54..56] delta, [72] derived; a u16 status at byte +0x13e (318).
 * Used by 021aa898 / 021aaa58 / 021aa9cc (the set-object-params family).      */
extern char data_ov000_021c73e0[];   /* int** -> active object */

/* Big config struct (byte offsets): +0x1ac(428) active flag, +0x20c(524),
 * +0x2a4(676) mode-bits word (mask 0x807fffff, set bit23/bit25), +0x2a8(680),
 * +0x2ac(684), +0x2b0(688) packed config. Used by 021adb9c/af420/af3f0/adb70. */
extern char data_ov000_021c758c[];
extern char data_ov000_021c75c4[];   /* parallel config: +0x174(372) callback fp, +0x264(612) base */
extern char data_ov000_021c7770[];   /* a subsystem-state flag (021aecf8) */

/* --- stride-44 row array (021c7530) — BITFIELD family, DEFERRED ---------
 * data_ov000_021c7530 is an array of 44-byte rows; the accessors do byte /
 * sub-byte bitfield inserts at +8 / +12 (021ab4bc |=, 021ab4ec &=~, 021ab520,
 * 021ab5ac, 021ab688, 021ab564, …). NEAR-MISS this wave: an 8-bit bitfield
 * write models as `row[idx].b12 |= v` and reaches 12v12 byte-for-byte EXCEPT
 * the `bic`/`and` pair is emitted in the opposite order (mwcc bitfield-insert
 * scheduling) — a 2-instruction swap that did not flip from C. Likely needs a
 * different mwcc sub-rev or ship-as-.s. Bank as a wave-2 target.              */
struct Ov000Row { char pad0[12]; unsigned b12 : 8; unsigned : 24; char pad16[28]; };  /* stride 44 */
extern struct Ov000Row data_ov000_021c7530[];

/* --- main-arm9 sinks the reachable cohort leans on (extern, already named) -
 * func_0201d530 (VRAM offset by mode), func_02094504 (VRAM clear), func_0201d4b4,
 * func_0201ef3c (flush deferred), func_02001e5c (idle query), func_0208bfc4,
 * func_021aa7e0/_021aa5b8/_021aa8d4 (object helpers), func_021ac7dc, func_021ad464. */

#endif /* OV000_CORE_H */
