/* data_ov000_021b562c (12 bytes, 4-aligned): table of 3 DATA pointers,
 * NOT a jump table despite the census's "jump_table" shape label
 * (docs/research/data/cm-data-restock-census-2026-08-03.md:311) --
 * verified per this wave's required cross-check: all 3 words are
 * confirmed real relocations (relocs.txt:627-629, `from:0x021b562c/
 * 5630/5634 kind:load to:0x021b6460/6478/6490`, all `module:overlay(0)`),
 * and every target is `kind:data(any)` in
 * config/eur/arm9/overlays/ov000/symbols.txt at that exact address --
 * none is `kind:function`, and none falls in this module's own .text
 * range (0x021aa4a0-0x021af7d0 per delinks.txt's module header), which
 * rules out both "jump table" (array of code addresses for a computed
 * switch/goto) and "function-pointer table" (array of callable code
 * addresses): all 3 targets sit deep inside ov000's own `.data`
 * (0x021b6400-0x021c73e0), a section .text can never reach.
 *
 * Byte-identical sibling of data_ov000_021b5644 (same 3 words: 0x021b6460,
 * 0x021b6478, 0x021b6490; same consumption shape in the "clone pair"
 * sibling function) -- see that file. NOT adjacent to it despite being
 * the other census "jump_table" row: the delinks.txt gap this symbol
 * fills (0x021b5628-0x021b5638) ends exactly at the already-shipped
 * src/overlay000/data_ov000_021b5638.c (a real, distinct TU), which
 * itself sits immediately before data_ov000_021b5644's own separate gap
 * (0x021b5644-0x021b5650) -- the two census rows are genuinely separate,
 * non-contiguous candidates, not one composed object.
 *
 * Also note: this symbol's own gap (0x021b5628-0x021b5638, 16 bytes) is
 * NOT fully claimed by this file alone -- `data_ov000_021b5628` (4
 * bytes, addr 0x021b5628, value 0x00180020) is a distinct, still-
 * unclaimed neighbor immediately before this candidate, absent from
 * this wave's assigned candidate list and from the census near this
 * range. Left uncarved / flagged for a follow-up wave, not claimed here.
 *
 * Section: config/eur/arm9/overlays/ov000/delinks.txt's module header
 * confirms `.rodata start:0x021af7d0 end:0x021b63fc` covers this address
 * -> const.
 *
 * Raw address-literal casts, not `extern char X; &X` -- an `&symbol`
 * reference makes mwcc emit a real relocation, which places the
 * containing global in `.data` regardless of any `const` qualifier;
 * ground truth here is `.rodata`, so literal casts are required to
 * compile cleanly into the right section (same reasoning + precedent as
 * data_ov011_021d2fd4.c / 021d30f8.c / 021d3178.c and
 * data_ov012_021cc180.c, all `.rodata` pointer tables to not-yet-carved
 * targets). None of the 3 pointer targets (data_ov000_021b6460/6478/
 * 6490) is claimed in delinks.txt yet -- ov000's entire `.data` section
 * has zero existing TUs at time of writing.
 *
 * Consumer: func_ov000_021ad8dc (src/overlay000/func_ov000_021ad8dc.s,
 * whole-function ship-as-.s, unmatched), `_LIT0` (defined line 181:
 * `.word data_ov000_021b562c`; relocs.txt:253 `from:0x021adb18
 * kind:load to:0x021b562c`), loaded line 39. Lines 39/42-43:
 * `ldr r1,_LIT0; ldmia r1,{r0,r1,r2}; stmia r3,{r0,r1,r2}` copies all 3
 * words to a local stack array (sp+0x28..0x34). Line 66
 * `add r0,sp,#0x28` then line 67 `ldr r0,[r0,r4,lsl #0x2]` selects
 * element `r4` -- the function's OWN first incoming argument
 * (`mov r4,r0` at entry, line 41) -- i.e. a genuine runtime-indexed
 * lookup, not a fixed-offset read. Lines 68-70: the selected pointer
 * becomes arg0 to `func_02006c0c` (`mov r1,#0x4; mov r2,#0x0; bl
 * func_02006c0c`) -- the project's confirmed task-creation convention,
 * `func_02006c0c(template, 4, 0)` (docs/research/constants/
 * MainConstants.md "func_02006c0c task-creation convention"; the one
 * shipped call site, src/overlay000/func_ov000_021aae34.c, types the
 * first argument plain `int`). This settles the shape: an indexed
 * template-pointer lookup table for a task spawn, not a switch/goto
 * jump table.
 */

void *const data_ov000_021b562c[3] = {
    (void *)0x021b6460,  /* -> data_ov000_021b6460 (uncarved) */
    (void *)0x021b6478,  /* -> data_ov000_021b6478 (uncarved) */
    (void *)0x021b6490,  /* -> data_ov000_021b6490 (uncarved) */
};
