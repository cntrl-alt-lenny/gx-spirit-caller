/* ov014_core.h — per-overlay vocabulary for the ov014 clean-C drain (brief 344,
 * the fresh overlay after ov019 drained). ov014 is a paired-pane scene
 * controller (touch hit-testing, pane init/teardown, a slide-in/out animation).
 *
 * THIN for clean C: no clone families (the lone 0x7c size-pair is coincidental),
 * and the residue is dominated by the SAME Mac-lane shapes already catalogued in
 * ov017/ov019 — see §DEFERRED. Knowledge sketch, NOT a compiled dependency.
 * §VERIFIED is byte-proven (brief 344, 3 picks, EUR objdiff 100% + sha1 OK).
 */
#ifndef OV014_CORE_H
#define OV014_CORE_H

/* Touch hit-test rect (021b34f0 / 021b3440): x/y u16, w/h u8 (+ attr u16 at
 * +0xa for the 021b3440 payload variant). */
typedef struct {
    unsigned short x;
    unsigned short y;
    unsigned char w;
    unsigned char h;
} Rect;

/* --- dominant data bases ------------------------------------------------ */
extern char data_ov014_021b5040[];  /* scene lock/state: +0x44 transition lock */
extern char data_ov014_02235094[];  /* pane-A controller struct                */
extern char data_ov014_022350f4[];  /* pane-B controller struct                */
extern char data_ov014_022350e0[];  /* render-task handle pair                 */

/* =======================================================================
 * §VERIFIED — brief 344 wave 1 (3 picks, EUR objdiff 100% + sha1 OK):
 *   021b34f0  touch hit-test (alt input func_02006148/0200617c); ov019 021b27a0
 *             recipe + the comparison-operand-order lever (`x+w > px`).
 *   021b3440  touch hit-test (primary input) + a0-lock guard; on hit, latches
 *             rect+0xa byte-pair into a0->0x30/0x34. (u16 promoted-to-int >>8
 *             gives the orig's asr#8.)
 *   021b25b0  paired-pane per-frame update; early-out on lock, `(a&&b)` done
 *             flag, latch lock when both done; returns done. (ov019 021b2610.)
 *
 * §DEFERRED — ov014's gap is mostly the SAME Mac-lane shapes as ov017/ov019:
 *   021b2eec  3-state slide anim: switch-discriminant r0/r1 (= ov017 021b33dc).
 *   021b26ec  script-step dispatcher: post-blx increment rotation (= ov017
 *             021b2c8c / ov019 021b26d0) — the THIRD overlay with this exact wall.
 *   021b3b9c  held-const teardown loop: LICM base/const numbering (= ov017
 *             021b6774).
 *   021b4810 (60%) / 021b41b8: BGCNT bit-manip — the field intermediate lands in
 *             a different caller-saved reg (orig r12/ip vs mine reuses a read
 *             reg); MMIO read-twice is fine, the register dance is Mac-only.
 *   021b3fc4 (26%) loop teardown: strength-reduction differs (orig 3 pointer IVs;
 *             explicit-IV reshape only reached 26%). SR-class, Mac.
 *   021b2644 (80%) / 021b274c (95.8%): clean bodies (direct-MMIO + nested ifs /
 *             3-bit bitfield compare) but a gotcha-20 BLOCK-LAYOUT placement
 *             diff in the nested-if exit; nested vs guard forms both tried.
 *   021b4248 RGB555 bit-pack (frameless), caller-saved like ov019 021b28dc.
 *   021b2280/2fb8/3568/3938/4040/3c20… big render/init builders.
 * ======================================================================= */

#endif /* OV014_CORE_H */
