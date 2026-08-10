/* data_ov000_021b567c (16 bytes, 4-aligned): table of 4 DATA pointers,
 * NOT a function-pointer table despite the census's "fnptr_table" shape
 * label (docs/research/data/cm-data-restock-census-2026-08-03.md:291) --
 * verified per this wave's required cross-check: all 4 words are
 * confirmed real relocations (relocs.txt:641-644, `from:0x021b567c/
 * 5680/5684/5688 kind:load to:0x021b64a8/6508/64c0/64d8`, all
 * `module:overlay(0)`), and every target is `kind:data(any)` in
 * symbols.txt -- none is `kind:function`, and none falls in ov000's own
 * .text range (0x021aa4a0-0x021af7d0); all 4 land deep inside ov000's
 * own `.data` (0x021b6400-0x021c73e0). Note the target order is NOT
 * ascending by address (0x64a8, 0x6508, 0x64c0, 0x64d8 -- element 2 is
 * numerically lower than element 1), independently confirming this is a
 * hand-authored record, not a mechanically-generated sequential table.
 *
 * Consumer: func_ov000_021ad084 (src/overlay000/func_ov000_021ad084.s,
 * whole-function ship-as-.s, unmatched), `_LIT7` (defined line 254:
 * `.word data_ov000_021b567c`; relocs.txt:641 `from:0x021b567c`), loaded
 * line 177 -- the SECOND of two independent 4-word blocks this function
 * reads (see data_ov000_021b566c.c for the first). Lines 177-180: `ldr
 * r0,_LIT7; add ip,sp,#0x18; ldmia r0,{r0,r1,r2,r3}; stmia
 * ip,{r0,r1,r2,r3}` bulk-copies all 4 words to a local stack buffer.
 * Line 181 `bl func_0201e7e0` -- the already-matched no-op NitroSDK
 * `FX_Init`, not the real consumer (see data_ov000_021b565c.c). Lines
 * 186-187 `add r0,sp,#0x18; str r0,[sp,#0x8]` forward the local buffer's
 * address as one of `func_0201ef90`'s stack arguments (line 198 `bl
 * func_0201ef90`) -- same optional-block-gate pattern as the other 3
 * fnptr_table-labeled candidates this wave, here with sibling constants
 * 0x1a0/1/0/0x20 and `mov r3,#0x1c400`.
 *
 * Independently corroborated: docs/research/retriage/Ov000Deep.md:650
 * flagged this table (alongside data_ov000_021b566c) as a new KB gap
 * feeding `func_0201ef90`; this file resolves that gap.
 *
 * Section: `.rodata start:0x021af7d0 end:0x021b63fc` covers this address
 * -> const.
 *
 * Raw address-literal casts, not `extern char X; &X` -- an `&symbol`
 * reference would force this `const` global into `.data`; ground truth
 * is `.rodata`. Precedent: data_ov011_021d2fd4.c / 021d30f8.c /
 * 021d3178.c, data_ov012_021cc180.c. None of the 4 pointer targets is
 * claimed in delinks.txt yet.
 */

void *const data_ov000_021b567c[4] = {
    (void *)0x021b64a8,  /* -> data_ov000_021b64a8 (uncarved) */
    (void *)0x021b6508,  /* -> data_ov000_021b6508 (uncarved) */
    (void *)0x021b64c0,  /* -> data_ov000_021b64c0 (uncarved) */
    (void *)0x021b64d8,  /* -> data_ov000_021b64d8 (uncarved) */
};
