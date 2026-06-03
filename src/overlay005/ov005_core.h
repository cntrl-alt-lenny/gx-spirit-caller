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
extern char data_ov005_021b1618[];  /* glyph default code (021af874) */
/* data_02104f4c: shared main-arm9 global mode object; the low 3 bits of word[1]
 * are the "channel" (read via an `unsigned :3` bitfield → lsl#29/lsr#29). The
 * +0x5c attribute halfword carries a 4-bit field at bit 6 (read via the int
 * expression `((unsigned)h << 22) >> 28`). Both recur across the overlay. */
extern struct { int w0; unsigned chan : 3; } data_02104f4c;

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

/* ====================================================================== *
 *  §VERIFIED — co-drain wave 2 (brief 329). 7 .c, all EUR objdiff 100% +  *
 *  ninja rom OK. Drained the rest of the EASY <0x98 tier; the remainder   *
 *  is alloc/layout-divergent (see THINNING below). ov005 matched 19 -> 26.*
 * ====================================================================== */
/* Picks (all <0x98 singletons — ov005 has NO clone families):
 *  - 021acf34: teardown sequence (capture primary result, run secondary, then
 *    disable two channel pairs). - 021ac9dc: linear search of the +0x60 array
 *    (stride 0x10), live count re-read each step, return index or -1.
 *  - 021aaea8: endpoint-pair interpolate; the (sub,scale,add) tail is
 *    DUPLICATED per branch (write each branch self-contained, do not share).
 *  - 021aafac: command-buffer bind; the +0xc cursor RELOADS o[1] (`*(o[1]+8)`)
 *    rather than reusing the just-stored buf reg; load the task slot into a
 *    temp before the (count+1)*2 arg so the ldr sequences before the shift.
 *  - 021ac984: clamp = min(layout_count, (height_span)/16). The +0x5c 4-bit
 *    field → `((unsigned)h<<22)>>28`; `/16` matches mwcc's signed-div idiom as
 *    written; the min MUST be `int r=d; if(x<=d) r=x; return r;` (a ternary
 *    flips the incumbent register). - 021aca64: scroll-begin guard; reuses the
 *    021ac984 + 021ab108 shapes; bind func result to a temp (`int y=f(); d=x-y-1`)
 *    so the subtract chain keeps the call-result register.
 *  - 021abe04: window-clear loop; reuse the `x` PARAM in place as lo
 *    (`int hi=x+w; x-=0x10;`) so lo keeps x's register and hi gets a fresh one.
 *
 * RECIPE (the wave-2 lever): most ov005 near-misses are pure register-choice.
 * mwcc picks the "incumbent" register from how the C is shaped — so to match,
 * (a) bind a call result to a named temp before reusing it, (b) reuse a PARAM
 * in place rather than a new local, (c) use an explicit `if`-assign instead of
 * a ternary for min/max. These flipped 021ac984/021aca64/021abe04 to 100%.
 *
 * DEFERRED near-misses (NOT shipped — route per brief / catalogue):
 *  - 021acfb0 (0x68) indirect-dispatch blx — PERMUTER class (with ov008
 *    021aafa4), 24v26 post-blx scheduling. (Carried from wave 1.)
 *  - 021ad284 (0xd8) 3-state MMIO scroll machine — 92.6%, the switch
 *    discriminant lands in r0 not r1 (allocator coin-flip; temp/hoist did not
 *    move it). - 021af874 (0x78) glyph switch — 83%, the chan!=0 handler vs the
 *    default block are emitted in swapped order (mwcc block placement).
 *    Both are direct-mwcc-resistant register/layout misses, NOT permuter-class.
 *  - 021af704 (0x4c) byte-sum loop — 47%, mwcc strength-reduces to a pointer
 *    bump (extra IV) where the orig keeps the base + indexes; no C form found
 *    that blocks the SR (tried (o+i)[K], int-cast, struct field, volatile).
 *
 * ⚠️ THINNING (brief 329 asked to flag <~6/wave): the easy <0x98 tier is now
 * essentially drained (waves 1+2 = 20 funcs). What remains is the 0x98+ tier
 * (bigger constructors/loops) + a residue of alloc/layout near-misses + the
 * permuter near-miss. Wave 2 hit 7 only by spending real per-pick iteration;
 * the marginal next wave looks like ~4-6. Recommend the brain pivot the
 * scaffolder to a fresh richer vein (ov020 = 32 funcs <0x100, ov015 = 31) and
 * leave ov005's tail for a permuter / m2c pass. Full writeup: brief 329 doc. */

#endif /* OV005_CORE_H */
