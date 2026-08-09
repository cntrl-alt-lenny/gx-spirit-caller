/* data_ov011_021d2fd4 (16 bytes, 4-aligned): table of 4 DATA pointers,
 * NOT a function-pointer table despite the census's "fnptr_table" shape
 * label (docs/research/data/cm-data-restock-census-2026-08-03.md:298) --
 * verified per this wave's required cross-check: all 4 words are
 * confirmed real relocations (relocs.txt:1289-1292, `from:0x021d2fd4/
 * 2fd8/2fdc/2fe0 kind:load to:0x021d3808/37f4/381c/3830`, all
 * `module:overlay(11)`), and every target matches a `kind:data(any)`
 * entry in config/eur/arm9/overlays/ov011/symbols.txt at that exact
 * address -- none is `kind:function`. All 4 targets are members of the
 * same not-yet-carved, 0x14-stride "actor/view slot" data table
 * spanning roughly 0x021d3664-0x021d3fcc (the same family
 * data_ov011_021d41a0's sibling chain and the proven 5-slot byte-pair
 * tables in data_ov011_021d2fb4.c reference); none of the 4 individual
 * slot symbols is claimed in delinks.txt yet.
 *
 * Section: config/eur/arm9/overlays/ov011/delinks.txt:2 confirms
 * `.rodata start:0x021d2f90 end:0x021d3620` covers this address ->
 * `const`.
 *
 * Raw address-literal casts, not `extern char X; &X` -- an `&symbol`
 * reference makes mwcc emit a real relocation, which places the
 * containing global in `.data` regardless of any `const` qualifier;
 * ground truth here is `.rodata`, so literal casts are required to
 * compile cleanly into the right section. Same reasoning + precedent as
 * in-module siblings data_ov011_021d30f8.c / data_ov011_021d3178.c and
 * cross-module data_ov012_021cc180.c (all `.rodata` pointer tables);
 * docs/research/cluster-d-recipe.md's D-1 recipe assumes a `.data`
 * target and doesn't apply as-is here.
 *
 * Consumer: src/overlay011/func_ov011_021cb574.s (1520-byte GLOBAL_ASM
 * cross-overlay-BL wall, brief 192/197/209, no mnemonic .s or .c exists
 * or ever will). Hand-decoded directly from the raw opcode words:
 * `.word 0xe59f040c` at ARM addr 0x021cb708 (file line 149) = `ldr
 * r0,[pc,#0x40c]`; pc=0x021cb710, +0x40c = 0x021cbb1c, matching
 * relocs.txt:305 `from:0x021cbb1c kind:load to:0x021d2fd4` exactly ->
 * r0 = &data_ov011_021d2fd4. Immediately after (lines 150-152):
 * `add r5,sp,#0x20`; `.word 0xe890000f` = `ldm r0,{r0,r1,r2,r3}` (loads
 * all 4 words from data_ov011_021d2fd4 in one block); `.word
 * 0xe885000f` = `stm r5,{r0,r1,r2,r3}` -- a bulk 16-byte block copy into
 * a local stack scratch buffer, passed shortly after (line 153) to
 * `func_0201e7e0` (SDK-namespace call, no ov011 prefix). This confirms
 * the object is consumed as an opaque 4-word block (LDM/STM, not
 * per-element indexed at runtime), unlike the per-actor-indexed sibling
 * data_ov011_021d2fb4/_021d2fbe tables -- consistent with a constant
 * argument-block template, not a runtime lookup table.
 */

void *const data_ov011_021d2fd4[4] = {
    (void *)0x021d3808,  /* -> data_ov011_021d3808 (uncarved) */
    (void *)0x021d37f4,  /* -> data_ov011_021d37f4 (uncarved) */
    (void *)0x021d381c,  /* -> data_ov011_021d381c (uncarved) */
    (void *)0x021d3830,  /* -> data_ov011_021d3830 (uncarved) */
};
