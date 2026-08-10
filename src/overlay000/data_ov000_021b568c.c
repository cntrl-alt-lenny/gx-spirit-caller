/* data_ov000_021b568c (16 bytes, 4-aligned): table of 4 DATA pointers,
 * NOT a function-pointer table despite the census's "fnptr_table" shape
 * label (docs/research/data/cm-data-restock-census-2026-08-03.md:292) --
 * verified per this wave's required cross-check: all 4 words are
 * confirmed real relocations (relocs.txt:645-648, `from:0x021b568c/
 * 5690/5694/5698 kind:load to:0x021b6558/6574/6590/65ac`, all
 * `module:overlay(0)`), and every target is `kind:data(any)` in
 * symbols.txt -- none is `kind:function`, and none falls in ov000's own
 * .text range (0x021aa4a0-0x021af7d0); all 4 land deep inside ov000's
 * own `.data` (0x021b6400-0x021c73e0). Byte-identical sibling of
 * data_ov000_021b565c (same 4 words: 0x021b6558/6574/6590/65ac) -- see
 * that file for the full `func_0201ef90` optional-block-gate trace,
 * which applies line-for-line here too.
 *
 * Consumer: func_ov000_021ad660 (src/overlay000/func_ov000_021ad660.s,
 * whole-function ship-as-.s, unmatched, the "clone pair" sibling of
 * func_ov000_021ad8dc), `_LIT7` (defined line 188: `.word
 * data_ov000_021b568c`; relocs.txt:645 `from:0x021b568c`), loaded line
 * 122. Lines 122-125 bulk-copy all 4 words to a local stack buffer
 * (`sp+0x18`); line 126 `bl func_0201e7e0` is the already-matched no-op
 * `FX_Init`, not the real consumer (see data_ov000_021b565c.c); lines
 * 131-132 forward the local buffer's address as one of
 * `func_0201ef90`'s stack arguments (line 144 `bl func_0201ef90`), with
 * the SAME downstream constants as data_ov000_021b565c's call site
 * (0x1e0/1/0/0x20/0x1dc00, same literal-pool config globals
 * data_ov000_021c75c4/75c8/760c) -- confirming this and 021b565c really
 * are parallel per-instance data for the twin-function pair, not just
 * coincidentally-equal bytes.
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

void *const data_ov000_021b568c[4] = {
    (void *)0x021b6558,  /* -> data_ov000_021b6558 (uncarved) */
    (void *)0x021b6574,  /* -> data_ov000_021b6574 (uncarved) */
    (void *)0x021b6590,  /* -> data_ov000_021b6590 (uncarved) */
    (void *)0x021b65ac,  /* -> data_ov000_021b65ac (uncarved) */
};
