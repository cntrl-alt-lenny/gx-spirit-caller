/* ov005_core.h — ov005 per-overlay vocabulary (brief 327, co-drain wave 1).
 *
 * Scaffolder's drain stream pivoted ov008 -> ov005 (ov008 medium tier is
 * permuter-bound, brief-325). Direct-mwcc per-pick gate (EUR objdiff 100%);
 * the brain runs the 3-region SHA1 on merge. Own src/overlay005/ + ov005
 * delinks.txt + this header.
 *
 * ⚠️ OVERLAY-SWAP: ov005 shares base 0x021aa4a0 with ov000/ov002/ov008 (a
 * 4-overlay swap group — same memory, mutually exclusive). Per-overlay
 * delinks + gap objs keep it isolated (the decomper/scaffolder ran ov000 +
 * ov008 in this group fine). gotcha-18: an ov005 func at e.g. 0x021aa540 is a
 * DIFFERENT function than ov008's at the same address — they never co-exist.
 *
 * Shared sinks (already named in main): func_02006e1c / Task_InvokeLocked
 * (command-record/task), func_02094504 (VRAM clear), func_020b3870 (scale
 * lookup), func_0202c0c0 (glyph), func_0201ef3c (flush).
 */
#ifndef OV005_CORE_H
#define OV005_CORE_H

/* globals proven as the wave finds them (cached-base mandatory) */
extern char data_ov005_021b1e6c[];
extern char data_ov005_021b1e4c[];
extern char data_ov005_021b17e8[];  /* fn-ptr dispatch table */

/* ====================================================================== *
 *  §VERIFIED — co-drain wave 1 (brief 327). 13 .c, all EUR objdiff 100% + *
 *  clean re-delink drop-out + EUR `ninja sha1` OK (also confirms the      *
 *  swap-group isolation is byte-clean). ov005 matched: 6 -> 19.           *
 * ====================================================================== */
/* Picks by family (the recurring shapes all transferred from ov006/8):
 *  - u16-array bit set/clear + flag: 021ab32c (|=), 021ab354 (&=~). Shape:
 *    `((u16*)o->f16)[idx] |= v; o->f24 = (o->f24 & ~1) | 1;` (1-bit field set).
 *  - guarded-call (pair / + alloc): 021aaf40, 021aaf6c (`o[0]=02006c0c(..);
 *    021aafac(o,o[0])` — assign-then-pass so the store sequences first).
 *  - guard + setters: 021aca30. init-sequence: 021acf78.
 *  - guarded VRAM clear: 021abc88 (`(o+idx)[6]` keeps base+offset; `w==0||h==0`
 *    reads h LAZILY in the condition -> ldrhne). clamp+dual-call: 021abdb8.
 *  - guarded flush + MMIO double-RMW: 021ad20c — use ABSOLUTE MMIO addresses
 *    (`*(volatile int*)0x04000000`, `...0x04001000`), NOT a shared base local
 *    (shared -> base in r2; absolute -> r1 = orig). (ov016 recipe, re-proven.)
 *  - MMIO bitfield RMW leaf: 021b1000 — field read must be UNSIGNED
 *    (`volatile unsigned*`) for lsr not asr.
 *  - BOUNDS-CHECK family (021aa578 recipe): 021aee84 + 021aeefc (clone, sinks
 *    02006148/0200617c). `func_02006110(&A,&B); if(g()&&x<=A&&x+w>A&&y<=B&&
 *    y+h>B) return 1; return 0;` (rect = {u16 x,y; u8 w,h;}); && chain ->
 *    shared return-0.
 *  - node compare+mla: 021ab2e0.
 * Deferred near-miss: 021acfb0 indirect-dispatch (blx) — 24v26 post-blx block
 *   scheduling, same permuter class as ov008 021aafa4. */

#endif /* OV005_CORE_H */
