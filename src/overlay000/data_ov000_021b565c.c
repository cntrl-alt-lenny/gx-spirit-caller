/* data_ov000_021b565c (16 bytes, 4-aligned): table of 4 DATA pointers,
 * NOT a function-pointer table despite the census's "fnptr_table" shape
 * label (docs/research/data/cm-data-restock-census-2026-08-03.md:289) --
 * verified per this wave's required cross-check: all 4 words are
 * confirmed real relocations (relocs.txt:633-636, `from:0x021b565c/
 * 5660/5664/5668 kind:load to:0x021b6558/6574/6590/65ac`, all
 * `module:overlay(0)`), and every target is `kind:data(any)` in
 * symbols.txt -- none is `kind:function`, and none falls in ov000's own
 * .text range (0x021aa4a0-0x021af7d0); all 4 land deep inside ov000's
 * own `.data` (0x021b6400-0x021c73e0).
 *
 * Consumer: func_ov000_021ad8dc (src/overlay000/func_ov000_021ad8dc.s,
 * whole-function ship-as-.s, unmatched), `_LIT7` (defined line 188:
 * `.word data_ov000_021b565c`; relocs.txt:633 `from:0x021b565c`), loaded
 * line 122. Lines 122-125: `ldr r0,_LIT7; add r4,sp,#0x18; ldmia
 * r0,{r0,r1,r2,r3}; stmia r4,{r0,r1,r2,r3}` bulk-copies all 4 words to a
 * local stack buffer. Line 126 `bl func_0201e7e0` looks like it consumes
 * r0-r3 (the 4 raw words) directly as scalar args, but func_0201e7e0 is
 * the ALREADY-MATCHED NitroSDK `FX_Init`
 * (libs/nitro/func_0201e7e0.legacy.c: `void func_0201e7e0() { return; }`)
 * -- a genuine no-op that reads no registers, so this call is a red
 * herring for this data's shape, not its real consumer. The REAL
 * consumer is the second use: lines 131-132 `mov r1,r4; str r1,[sp,
 * #0x8]` forward the local buffer's ADDRESS (not its content) as one of
 * `func_0201ef90`'s stack arguments (line 144 `bl func_0201ef90`).
 * `func_0201ef90` (src/main/func_0201ef90.s, unmatched) treats that
 * pointer (its own `r5`) as 4 independent optional-block gates: lines
 * 31-35 `ldr r1,[r5]; cmp r1,#0; ldrne r0,[r5,#4]; cmpne r0,#0; beq
 * .L_70` (skip unless words 0 AND 1 are both non-null), lines 39-41
 * `ldr r1,[r5,#0x4]` reloaded and passed as a real argument to
 * `func_0201ed74`, lines 48-50 `ldr r1,[r5,#0x8]; cmp r1,#0; beq .L_a4`
 * (word 2 is a pure null/non-null gate), lines 62-65 `ldr r1,[r5,#0xc];
 * cmp r1,#0; ...return-early-if-zero` (word 3 is likewise a pure gate).
 * So this is an optional-feature-block template passed by pointer into
 * a shared builder, not a jump table and not a directly-called
 * function-pointer array.
 *
 * Byte-identical sibling of data_ov000_021b568c (same 4 words, same
 * consumption shape -- including the same downstream `func_0201ef90`
 * constants, 0x1e0/1/0/0x20/0x1dc00 and the same literal-pool config
 * globals data_ov000_021c75c4/75c8/760c -- in the "clone pair" sibling
 * function func_ov000_021ad660). See that file.
 *
 * Section: `.rodata start:0x021af7d0 end:0x021b63fc` covers this address
 * -> const.
 *
 * Raw address-literal casts, not `extern char X; &X` -- an `&symbol`
 * reference would force this `const` global into `.data`; ground truth
 * is `.rodata`. Precedent: data_ov011_021d2fd4.c / 021d30f8.c /
 * 021d3178.c, data_ov012_021cc180.c (the latter is an especially close
 * match: also a table forwarded by pointer to `func_0201ef90`). None of
 * the 4 pointer targets is claimed in delinks.txt yet.
 */

void *const data_ov000_021b565c[4] = {
    (void *)0x021b6558,  /* -> data_ov000_021b6558 (uncarved) */
    (void *)0x021b6574,  /* -> data_ov000_021b6574 (uncarved) */
    (void *)0x021b6590,  /* -> data_ov000_021b6590 (uncarved) */
    (void *)0x021b65ac,  /* -> data_ov000_021b65ac (uncarved) */
};
