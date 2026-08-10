/* data_ov011_021d3374 (2 bytes) + data_ov011_021d3376 (30 bytes):
 * restock-census carve wave 6, TU-composition carve per
 * docs/research/alignment-wall-tu-composition-recipe.md -- two adjacent
 * symbols, address order, both-ends-4-aligned composed span
 * (0x021d3374-0x021d3394, 32 bytes, start %4==0, end %4==0).
 *
 * n=2, sizes 2 then 30 (STRICTLY ASCENDING in address order) -- this is
 * the shape codegen-walls.md's P-48 confirms safe: P-48's wall only
 * fires when address-ascending order and size-ascending order disagree
 * (a size DECREASE somewhere in the sequence). Here there is none.
 * Matches the exact shape already proven safe twice
 * (data_ov016_021b9374.c 10B+30B; data_ov022_021ab8e4.c 26B+142B).
 *
 * DISCOVERY CONTEXT: this pair sits inside the same 344-byte
 * `0x021d323c`-`0x021d3394` gap as the P-48-declined
 * `data_ov011_021d323c`/`_32ba` pair (wave 5/6) and two further
 * uncarvable members, `data_ov011_021d32d8`(1B)/`_32d9`(113B)/
 * `_334a`(42B) -- that middle cell's sizes (1,113,42 in address order)
 * are non-monotonic (113->42 descends), hitting the identical P-48
 * mechanism, and `_32d9` itself never starts 4-aligned so it cannot
 * anchor a smaller sub-span either. This pair, by contrast, is a
 * genuinely separate both-ends-4-aligned cell (0x021d3374-0x021d3394)
 * bounded by 4-aligned points on both sides, with no size-ordering
 * problem -- confirmed by direct arithmetic against current
 * config/eur/arm9/overlays/ov011/symbols.txt, not assumed from the
 * census's original (incomplete) candidate list.
 *
 * Both symbols are physically part of the same 0x72(114)-byte-stride
 * per-actor "row" table whose absolute origin is the still-uncarved
 * `data_ov011_021d32d8` -- documented in the already-shipped
 * `src/overlay011/data_ov011_021d3394.c`'s own header comment ("this
 * symbol turns out to be 2 clean fields... of a much larger 0x72-stride
 * row table starting at (still uncarved) data_ov011_021d32d8, confirmed
 * by 9+ independent consumer functions"). This pair is row 1's `+0x2a`
 * and `+0x2c` fields (row 1's base, `data_ov011_021d334a`, is one of
 * the uncarvable neighbors above).
 *
 * Consumers (2 independent, still-`.s`-shipped whole-function walls,
 * both with existing UNVERIFIED c-match-prep drafts corroborating the
 * same field offsets via computed rather than direct-literal
 * addressing):
 *  - src/overlay011/func_ov011_021cd2d4.s: literal-pool `_LIT1`/`_LIT2`
 *    (relocs.txt:469 from:0x021cd350 kind:load to:0x021d3374; :470
 *    from:0x021cd354 kind:load to:0x021d3376) -- reads both via `ldrh`
 *    (zero-extended halfword) at `base(row*0x72) + col*4`, each shifted
 *    `<<0xc` into an out-parameter.
 *  - src/overlay011/func_ov011_021d18b4.s: literal-pool `_LIT1`/`_LIT2`
 *    (relocs.txt:1142 from:0x021d1914 kind:load to:0x021d3374; :1143
 *    from:0x021d1918 kind:load to:0x021d3376) -- identical access
 *    pattern.
 * Corroborated (same bytes, computed offset instead of a direct
 * literal) by docs/research/c-match-prep/021d1080.c and 021d1110.c
 * ("cell + 0x2a" / "cell + 0x2c" fields, cell = data_ov011_021d334a +
 * row*0x72 + col*4 -- UNVERIFIED drafts, cited as corroboration only).
 *
 * data_ov011_021d3376's element [0] (this symbol's own address) is the
 * only one confirmed by a named relocation (both consumers above,
 * `_LIT2`); elements [1..14] are not individually confirmed by a
 * distinct relocation -- shipped as real, byte-exact ROM content
 * (extract_bytes.py, cross-checked MATCH against the current build
 * tree) filling the dsd-deduced span up to the already-shipped
 * data_ov011_021d3394.c boundary, matching this project's established
 * practice for opaque row-table tail bytes (cf.
 * data_ov011_021d3394.c's own "rest zero-padded" disclaimer for
 * sibling fields in the same row) -- 12 of the 15 elements are
 * literally 0x0000 in the real ROM.
 *
 * Section: config/eur/arm9/overlays/ov011/delinks.txt:2 confirms
 * `.rodata start:0x021d2f90 end:0x021d3620` -- covers this span, so
 * both symbols are `const`. relocs.txt has zero `from:` entries
 * originating inside 0x021d3374-0x021d3394, so neither symbol's own
 * bytes contain a relocated pointer.
 */

const unsigned short data_ov011_021d3374 = 0x010e;

const unsigned short data_ov011_021d3376[15] = {
    0x009f, 0x00f9, 0x0181, 0x0000, 0x0000,
    0x0000, 0x0000, 0x0000, 0x0000, 0x0000,
    0x0000, 0x0000, 0x0000, 0x0000, 0x0000,
};
