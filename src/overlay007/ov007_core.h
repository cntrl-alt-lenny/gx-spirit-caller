/* ov007_core.h — per-overlay vocabulary for the ov007 clean-C drain (brief 346,
 * fresh overlay after ov014). ov007 is the puzzle-board overlay: an OBJ cell
 * grid with per-cell open/draw/teardown, a value-list validity check, and
 * VRAM/BG bring-up. Despite an early "low-yield" flag, the open/teardown/init
 * call-wrapper subset matched cleanly.
 *
 * Knowledge sketch, NOT a compiled dependency. §VERIFIED byte-proven (brief 346,
 * 6 picks, EUR objdiff 100% + sha1 OK). NO clone families (all unique sizes).
 */
#ifndef OV007_CORE_H
#define OV007_CORE_H

/* --- dominant data bases ------------------------------------------------ */
extern char data_ov007_021b30b8[];  /* slot-descriptor table (row 0x20, col 4) */
extern char data_ov007_0223352c[];  /* work block A controller                 */
extern char data_ov007_022334d0[];  /* work block B controller                 */
extern char data_ov007_021b3480[];  /* script step-handler fn-ptr table        */
extern char data_ov007_021b2fa0[];  /* script step state [+0]=idx [+4]=timer   */

/* =======================================================================
 * §VERIFIED — brief 346 wave 1 (6 picks, EUR objdiff 100% + sha1 OK):
 *   021b2d0c  control-block init (open file + reset cursor)
 *   021b24a4  overlay teardown call-chain
 *   021b24e0  overlay shutdown; `(a && b)` close result + MMIO OR-write. LEVER:
 *             `(B<<1)|A` not `A|(B<<1)` to pick the `orr` operand reg (= ov009
 *             021ad6bc orr-shifted-operand-first).
 *   021b2920  sub-screen BG3 bring-up (volatile BGCNT RMW + VRAM/palette load)
 *   021b2b74  cell-config setter (7x func_020216b0 from ldrsh descriptor fields)
 *   021b2c58  cell open: table lookup + fn-ptr callback bind + colour pack.
 *             LEVER: `(unsigned char)a3 << 8` forces the orig's `and #0xff;
 *             lsl#8`; plain `(a3 & 0xff) << 8` under a (u16) cast folds to
 *             `lsl#24; lsr#16` (94->100).
 *
 * §DEFERRED — recurring Mac-lane shapes (MAC-PHASE DEDUP WORKLIST — same wall,
 *  many overlays; one Mac fix clears all sites):
 *   021b2280  script-step dispatcher post-blx increment rotation — = ov017
 *             021b2c8c / ov019 021b26d0 / ov014 021b26ec. **4th overlay.**
 *   021b25a0  switch-discriminant r0/r1 (3-state machine) — = ov017 021b33dc /
 *             ov014 021b2eec. **3rd overlay.**
 *   021b28c4  BGCNT bit-manip caller-saved field-reg dance — = ov014 021b4810 /
 *             021b41b8 (here the if/else doubles it; field in r3 vs reused read).
 *   021b2e84 (83%) value-list search: caller-saved address-computation reg swap
 *             (data-ptr r1 vs r2); reorder made it worse.
 *   021b2630  init with smulbb (constant-0 short index — mwcc folds my const, so
 *             no smulbb); 021b2ef0 sibling search loop.
 *   021b22d8/2694/2fb8/3c20 big builders.
 * ======================================================================= */

#endif /* OV007_CORE_H */
