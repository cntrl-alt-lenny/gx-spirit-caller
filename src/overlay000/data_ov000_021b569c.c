/* data_ov000_021b569c (24 bytes, 4-aligned): table of 6 DATA pointers
 * (with 2 repeated values), NOT a function-pointer table despite the
 * census's "fnptr_table" shape label
 * (docs/research/data/cm-data-restock-census-2026-08-03.md:283) --
 * verified per this wave's required cross-check: all 6 words are
 * confirmed real relocations (relocs.txt:649-654, `from:0x021b569c/
 * 56a0/56a4/56a8/56ac/56b0 kind:load to:0x021b64f0/6520/6520/653c/
 * 653c/65c8`, all `module:overlay(0)`), and every target is
 * `kind:data(any)` in symbols.txt -- none is `kind:function`, and none
 * falls in ov000's own .text range (0x021aa4a0-0x021af7d0); all 6 land
 * deep inside ov000's own `.data` (0x021b6400-0x021c73e0). Elements 1/2
 * (both 0x021b6520) and elements 3/4 (both 0x021b653c) are genuine,
 * independently relocated DUPLICATE pairs -- confirmed by relocs.txt,
 * not a transcription artifact.
 *
 * Consumer: func_ov000_021af5e0 (src/overlay000/func_ov000_021af5e0.s,
 * whole-function ship-as-.s, unmatched -- a fourth, unrelated function),
 * `_LIT0` (defined line 92: `.word data_ov000_021b569c`; relocs.txt:649
 * `from:0x021b569c`), loaded line 18. Lines 18/22-25: `ldr lr,_LIT0;
 * ldmia lr!,{r0,r1,r2,r3}; stmia ip!,{r0,r1,r2,r3}; ldmia lr,{r0,r1};
 * stmia ip,{r0,r1}` bulk-copies all 6 words (two ldmia/stmia pairs, 4
 * then 2) to a local stack buffer (`sp+0x0..0x18`). Lines 50-56: `ldr
 * r0,_LIT1(data_ov000_021c758c); ldr r0,[r0,#0x34]; mov r0,r0,lsl
 * #0x14; mov r0,r0,lsr #0x1c; ldr r0,[r2(sp+0),r0,lsl #0x2]` extracts a
 * 4-bit field (bits [11:8]) from `data_ov000_021c758c+0x34` and uses it
 * to INDEX the local copy, selecting ONE of the 6 words. Line 58
 * `bl func_02006c0c` -- the selected pointer becomes arg0 to
 * `func_02006c0c(template, 4, 0)`, the project's confirmed
 * task-creation convention (see data_ov000_021b562c.c) -- the SAME
 * consumption family as data_ov000_021b562c/021b5644 (indexed
 * template-pointer lookup feeding a task spawn), NOT the
 * `func_0201ef90` optional-block-gate pattern used by
 * 565c/566c/567c/568c, despite the superficially similar ldmia/stmia
 * bulk-copy prologue.
 *
 * This refines a prior finding: docs/research/retriage/Ov000Deep.md:998
 * flagged this table as "structurally identical in USAGE (ldmia/stmia
 * copy pattern) to the already-known data_ov000_021b566c/021b567c
 * blocks" -- true only for the copy step. Direct disassembly (this
 * wave) shows the copy is immediately followed by an indexed
 * single-element lookup feeding `func_02006c0c`, which is actually the
 * data_ov000_021b562c/021b5644 consumption shape, not the
 * data_ov000_021b566c/021b567c one.
 *
 * Section: `.rodata start:0x021af7d0 end:0x021b63fc` covers this address
 * -> const.
 *
 * Raw address-literal casts, not `extern char X; &X` -- an `&symbol`
 * reference would force this `const` global into `.data`; ground truth
 * is `.rodata`. Precedent: data_ov011_021d2fd4.c / 021d30f8.c /
 * 021d3178.c, data_ov012_021cc180.c. None of the 6 pointer targets
 * (021b64f0/6520/653c/65c8) is claimed in delinks.txt yet.
 */

void *const data_ov000_021b569c[6] = {
    (void *)0x021b64f0,  /* -> data_ov000_021b64f0 (uncarved) */
    (void *)0x021b6520,  /* -> data_ov000_021b6520 (uncarved) */
    (void *)0x021b6520,  /* -> data_ov000_021b6520 (uncarved), dup of [1] */
    (void *)0x021b653c,  /* -> data_ov000_021b653c (uncarved) */
    (void *)0x021b653c,  /* -> data_ov000_021b653c (uncarved), dup of [3] */
    (void *)0x021b65c8,  /* -> data_ov000_021b65c8 (uncarved) */
};
