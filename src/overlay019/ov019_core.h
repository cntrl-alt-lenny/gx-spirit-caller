/* ov019_core.h — per-overlay vocabulary for the ov019 clean-C drain (brief 340,
 * the fresh-overlay FALLBACK after the brief-340 re-sweep pilot yielded 0; see
 * docs/research/brief-340-resweep-pilot.md). ov019 is a paired-scene quiz
 * controller: a script-step dispatcher, two scene controllers updated in
 * lockstep, touch hit-testing, and a heavy render tier.
 *
 * Knowledge sketch, NOT a compiled dependency — matched .c keep inline externs.
 * §VERIFIED is byte-proven (brief 340, 5 picks, EUR objdiff 100% + sha1 OK).
 */
#ifndef OV019_CORE_H
#define OV019_CORE_H

/* Touch hit-test rect (021b2728 / 021b27a0): x/y u16, w/h u8. */
typedef struct {
    unsigned short x;
    unsigned short y;
    unsigned char w;
    unsigned char h;
} Rect;

/* --- dominant data bases ------------------------------------------------ */
extern char data_ov019_021b5e20[];  /* script state: [+0] step idx, [+4] timer */
extern char data_ov019_021b5b20[];  /* step-handler fn-ptr table [idx<<2]      */
extern char data_ov019_021b5e70[];  /* scene-A controller struct               */
extern char data_ov019_021b6848[];  /* scene-B controller struct               */
extern char data_02104f4c[];         /* system work: +0x928 boot/page counter   */

/* scene controller fields (a0+): +0x8 mode, +0xb8 fade flag, +0xbc slide flag,
 * +0xc4 slide offset (eased to 0x50 by 0x10), +0x440 work handle, +0x448 /
 * +0x4bc edit sub-buffers, +0x4c0 dirty, +0x4bc pending. */

/* =======================================================================
 * §VERIFIED — brief 340 wave 1 (5 picks, EUR objdiff 100% + sha1 OK):
 *   021b3028  guarded commit: flush staged glyph (func_0201ef3c), clear pair
 *   021b2610  paired-scene per-frame update; RETURNS (sceneA_done & sceneB_done)
 *   021b4ed0  gate predicate on a1 (unsigned counter compares); LEVER: `switch`
 *             not if/else-if for the forward-branch-to-case-block layout
 *   021b2728  touch hit-test (point-in-rect && chain); LEVER: write the upper
 *             bound as `r->x + r->w > px` (sum on the LEFT) so the cmp operand
 *             order matches — `px < r->x + r->w` flips it (80%->100%)
 *   021b27a0  alt-input sibling of 021b2728 (func_02006148 / func_0200617c)
 *
 * §DEFERRED (Mac/permuter + big-render tier):
 *   021b4c30 (70%) scene-B intro advance: caller-saved flag-load r0-vs-r1 (the
 *     flag has no call-arg use, so mwcc parks it in r1; not declaration-order
 *     reachable — same class as ov017 021b33dc/61dc).
 *   021b26d0 script-step dispatcher: the increment block's base/zero/index
 *     post-blx rotation (identical to ov017 021b2c8c, ~72% wall).
 *   021b3068 (261 insns) / 021b4a4c (120 insns): big render builders (the
 *     func_0201e964 cell-config family + sprite loops). func_0201e964 recipe
 *     applies but the length is long-tail.
 *   021b3f34 coord-offset wrapper (stack-struct build + forward); medium.
 * ======================================================================= */

#endif /* OV019_CORE_H */
