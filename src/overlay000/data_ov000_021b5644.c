/* data_ov000_021b5644 (12 bytes, 4-aligned): table of 3 DATA pointers,
 * NOT a jump table despite the census's "jump_table" shape label
 * (docs/research/data/cm-data-restock-census-2026-08-03.md:312) --
 * verified per this wave's required cross-check: all 3 words are
 * confirmed real relocations (relocs.txt:630-632, `from:0x021b5644/
 * 5648/564c kind:load to:0x021b6460/6478/6490`, all `module:overlay(0)`),
 * and every target is `kind:data(any)` in symbols.txt at that exact
 * address -- none is `kind:function`, and none falls in ov000's own
 * .text range (0x021aa4a0-0x021af7d0); all 3 land deep inside ov000's
 * own `.data` (0x021b6400-0x021c73e0). See data_ov000_021b562c.c for the
 * full rationale -- this is its byte-identical clone-pair sibling (same
 * 3 words: 0x021b6460, 0x021b6478, 0x021b6490).
 *
 * NOT adjacent to data_ov000_021b562c despite being the other census
 * "jump_table" row: the already-shipped src/overlay000/
 * data_ov000_021b5638.c (12 bytes, `const int[3]`) sits directly between
 * them (0x021b5638-0x021b5644), so the two rows are genuinely separate,
 * non-contiguous candidates. This symbol's own gap (0x021b5644-0x021b5650,
 * 12 bytes) is clean -- no other symbol falls inside it.
 *
 * Section: `.rodata start:0x021af7d0 end:0x021b63fc` (delinks.txt module
 * header) covers this address -> const.
 *
 * Raw address-literal casts, not `extern char X; &X` -- same
 * section-placement reasoning as data_ov000_021b562c.c (an `&symbol`
 * reference would force this `const` global into `.data`, corrupting
 * the proven `.rodata` placement); precedent: data_ov011_021d2fd4.c /
 * 021d30f8.c / 021d3178.c, data_ov012_021cc180.c. Neither pointer
 * target is claimed in delinks.txt yet.
 *
 * Consumer: func_ov000_021ad660 (src/overlay000/func_ov000_021ad660.s,
 * whole-function ship-as-.s, unmatched, the "clone pair" sibling of
 * func_ov000_021ad8dc above), `_LIT0` (defined line 181: `.word
 * data_ov000_021b5644`; relocs.txt:225 `from:0x021ad89c kind:load
 * to:0x021b5644`), loaded line 39. Same shape as data_ov000_021b562c's
 * consumer, line for line: lines 39/42-43 copy all 3 words to a local
 * stack array (sp+0x28..0x34); lines 65-66 (`add r0,sp,#0x28; ldr
 * r0,[r0,r4,lsl #0x2]`) select element `r4` (this function's own first
 * incoming argument); lines 67-69 hand the selected pointer to
 * `func_02006c0c(template, 4, 0)` (confirmed task-creation convention,
 * see data_ov000_021b562c.c). An indexed template-pointer lookup table
 * for a task spawn, not a jump table.
 */

void *const data_ov000_021b5644[3] = {
    (void *)0x021b6460,  /* -> data_ov000_021b6460 (uncarved) */
    (void *)0x021b6478,  /* -> data_ov000_021b6478 (uncarved) */
    (void *)0x021b6490,  /* -> data_ov000_021b6490 (uncarved) */
};
