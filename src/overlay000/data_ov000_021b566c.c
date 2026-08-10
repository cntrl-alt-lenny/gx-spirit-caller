/* data_ov000_021b566c (16 bytes, 4-aligned): table of 4 DATA pointers,
 * NOT a function-pointer table despite the census's "fnptr_table" shape
 * label (docs/research/data/cm-data-restock-census-2026-08-03.md:290) --
 * verified per this wave's required cross-check: all 4 words are
 * confirmed real relocations (relocs.txt:637-640, `from:0x021b566c/
 * 5670/5674/5678 kind:load to:0x021b6400/6418/6430/6448`, all
 * `module:overlay(0)`), and every target is `kind:data(any)` in
 * symbols.txt -- none is `kind:function`, and none falls in ov000's own
 * .text range (0x021aa4a0-0x021af7d0); all 4 land deep inside ov000's
 * own `.data` (0x021b6400-0x021c73e0). (Element 0's target, 0x021b6400,
 * is `.data`'s very first byte.)
 *
 * Consumer: func_ov000_021ad084 (src/overlay000/func_ov000_021ad084.s,
 * whole-function ship-as-.s, unmatched -- a THIRD, unrelated function,
 * not part of the 021ad660/021ad8dc clone pair), `_LIT6` (defined line
 * 253: `.word data_ov000_021b566c`; relocs.txt:637 `from:0x021b566c`),
 * loaded line 148. Lines 148-151: `ldr r0,_LIT6; add ip,sp,#0x28; ldmia
 * r0,{r0,r1,r2,r3}; stmia ip,{r0,r1,r2,r3}` bulk-copies all 4 words to a
 * local stack buffer. Line 152 `bl func_0201e7e0` -- the already-matched
 * no-op NitroSDK `FX_Init`, see data_ov000_021b565c.c for why this call
 * is not the real consumer. Lines 157-158 `add r0,sp,#0x28;
 * str r0,[sp,#0x8]` forward the local buffer's address as one of
 * `func_0201ef90`'s stack arguments (line 169 `bl func_0201ef90`) --
 * same optional-block-gate consumption pattern documented in
 * data_ov000_021b565c.c's `func_0201ef90` trace, this time with sibling
 * constants 0x600/2/1/0x200 (vs 565c's 0x1e0/1/0/0x20) and
 * `mov r3,#0x1c000`.
 *
 * Independently corroborated by prior research:
 * docs/research/retriage/Ov000Deep.md:650 (the `021AD084` writeup)
 * already flagged "`func_0201ef90` call sites each building a ...
 * config block from `data_ov000_021b566c`/`021b567c` literal tables via
 * `ldmia`/`stmia`" as a new KB gap -- this file resolves that gap.
 *
 * Sibling data_ov000_021b567c (also read by this same function, as a
 * SECOND, independent 4-word block later in the body) is a different,
 * not byte-identical, table -- these two are function-internal
 * neighbors, not a clone pair like 021b565c/568c.
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

void *const data_ov000_021b566c[4] = {
    (void *)0x021b6400,  /* -> data_ov000_021b6400 (uncarved) */
    (void *)0x021b6418,  /* -> data_ov000_021b6418 (uncarved) */
    (void *)0x021b6430,  /* -> data_ov000_021b6430 (uncarved) */
    (void *)0x021b6448,  /* -> data_ov000_021b6448 (uncarved) */
};
