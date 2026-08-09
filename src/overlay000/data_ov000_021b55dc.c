/* data_ov000_021b55dc (2 bytes) + data_ov000_021b55de (6 bytes):
 * restock-census carve wave 5 Part 2, TU-composition backward-absorption
 * carve. Recipe: docs/research/alignment-wall-tu-composition-recipe.md
 * (2+ adjacent symbols, declared as separate named globals of their own
 * types, in address order, in one TU, work when the composed span is
 * 4-aligned at BOTH the start and the end).
 *
 * Wave 4's census screen (docs/research/data/cm-restock-carve-4-2026-08-08.md
 * Part 1, row "ov000: 021b55de") declined data_ov000_021b55de as an
 * "Isolated single symbol, start misaligned, no adjacent misaligned
 * partner" -- true as far as it went: data_ov000_021b55dc's own start
 * (0x021b55dc, %4==0) is NOT misaligned, so it never appeared in that
 * census's population of misaligned candidates at all (absent from
 * docs/research/data/cm-data-restock-census-2026-08-03.md entirely; only
 * `_021b55de` appears there, row 186). This wave's re-examination of
 * config/eur/arm9/overlays/ov000/symbols.txt directly (rather than the
 * census's misaligned-only filter) found _021b55dc is a real,
 * individually-addressed symbol immediately BEFORE _021b55de, and that
 * composing the two produces a span 4-aligned at both ends:
 *   - data_ov000_021b55dc: addr 0x021b55dc (%4==0), deduced size 2 bytes
 *     (distance to the next symbol, data_ov000_021b55de).
 *   - data_ov000_021b55de: addr 0x021b55de (%4==2), deduced size 6 bytes
 *     (distance to data_ov000_021b55e4, the already-shipped next TU --
 *     see src/overlay000/data_ov000_021b55e4.c).
 *   - Combined span 0x021b55dc-0x021b55e4, 8 bytes: start %4==0, end
 *     %4==0 -- the proven n=2 shape, reached here via backward absorption
 *     from an already-aligned neighbor rather than from a second
 *     misaligned symbol. (data_ov000_021b55dc's own hypothetical solo TU
 *     would separately hit ALIGNALL(2) too, since its SIZE (2 bytes)
 *     isn't a 4-byte multiple even though its start already is -- the
 *     cluster-b-size-1-2-recipe.md mechanism, not wave 3's two-
 *     misaligned-starts mechanism; composing forward with _021b55de
 *     fixes both problems in one 8-byte TU.)
 *
 * Section discipline: config/eur/arm9/overlays/ov000/delinks.txt:2 --
 * `.rodata start:0x021af7d0 end:0x021b63fc` -- both addresses fall
 * inside .rodata, so both symbols are `const`. No already-shipped
 * .rodata TU exists between the section start and data_ov000_021b55e4.c
 * (the module's first .rodata delink entry, delinks.txt:842-844,
 * immediately preceded in file order by a .text entry ending exactly at
 * the section boundary 0x021af7d0) -- this pair sits inside that same
 * unclaimed gap, and the composed span's own end (0x021b55e4) exactly
 * meets data_ov000_021b55e4.c's start, so nothing is overrun.
 *
 * No cross-overlay coincidental-address alias exists for either symbol
 * (grep of every overlay's and main's symbols.txt/relocs.txt for
 * 0x021b55dc/0x021b55de found hits only in ov000's own config).
 *
 * Bytes: extracted via extract_bytes.py from
 * extract/eur/arm9_overlays/ov000.bin (pristine), cross-checked MATCH
 * against build/eur/build/arm9_ov000.bin:
 *   0x021b55dc  07 00 07 00 40 00 00 00
 *
 * --- Consumers ---
 *
 * data_ov000_021b55dc: relocs.txt:238 `from:0x021ad8d8 kind:load
 * to:0x021b55dc module:overlay(0)` -- the sole reloc, a literal-pool
 * load inside func_ov000_021ad660 (Ov000_SetupMainVram,
 * src/overlay000/func_ov000_021ad660.s, SHIP/HIGH per
 * docs/research/map/overlay000.md:108; confirmed intractable -- a
 * scheduling wall, not a data-typing gap -- per
 * docs/research/retriage/Ov000Deep.md's "0x021AD660 + 0x021AD8DC"
 * writeup). _LIT15 (line 196) loads the symbol's address into r4 (line
 * 149); the function's single-iteration loop (r8 pinned to 0 by
 * `cmp r8,#0x1; bcc .L_244` at lines 176/178) then does, verbatim
 * (lines 165-169):
 *     add r0, r4, r8, lsl #0x1      ; r0 = &data_ov000_021b55dc[0]
 *     ldrb r2, [r0, #0x1]           ; r2 = byte at +0x1 (0x00)
 *     ldrb r1, [r4, r8, lsl #0x1]   ; r1 = byte at +0x0 (0x07)
 *     mov r0, r9                    ; r0 = ctx (data_ov000_021c7718)
 *     bl func_ov000_021ac508
 * i.e. BOTH bytes are dereferenced individually via `ldrb` (not `ldrh`)
 * and forwarded as (a1, a2) to func_ov000_021ac508(ctx, a1, a2) --
 * MATCHED/HIGH, src/overlay000/func_ov000_021ac508.c, proposed name
 * Ov000_SetObjTwoBytes ("inserts two bytes (a1, a2) into p[1] at byte
 * offsets 2 and 3", docs/research/map/overlay000.md:66):
 *     void func_ov000_021ac508(int *p, int a1, int a2) {
 *         unsigned char b1 = a1, b2 = a2;
 *         p[1] = (p[1] & ~0xff0000u) | (((unsigned)b1 << 24) >> 8);
 *         p[1] = (p[1] & ~0xff000000u) | ((unsigned)b2 << 24);
 *     }
 * This proves the 2-byte record is genuinely a pair of independent
 * byte-sized fields, not a little-endian `short` -- the access pattern
 * is two `ldrb`s, never one `ldrh`.
 *
 * data_ov000_021b55de: relocs.txt:266 `from:0x021adb54 kind:load
 * to:0x021b55de module:overlay(0)` -- the sole reloc, inside
 * func_ov000_021ad8dc (Ov000_SetupMainVramAlt,
 * src/overlay000/func_ov000_021ad8dc.s, SHIP/MED per
 * docs/research/map/overlay000.md:109; the diff-verified structural twin
 * of _021ad660 above -- identical body, parallel data table, per
 * Ov000Deep.md). _LIT15 (line 196) loads the symbol's address into r4
 * (line 149); same single-iteration loop shape, lines 165-169:
 *     add r0, r4, r8, lsl #0x1      ; r0 = &data_ov000_021b55de[0]
 *     ldrb r2, [r0, #0x1]           ; r2 = byte at +0x1 (0x00)
 *     ldrb r1, [r4, r8, lsl #0x1]   ; r1 = byte at +0x0 (0x07)
 *     mov r0, r9                    ; r0 = ctx (data_ov000_021c7718 --
 *                                   ;   same base as _021ad660's ctx;
 *                                   ;   both twins drive the same object)
 *     bl func_ov000_021ac508
 * -- same callee, same (a1, a2)=(0x07, 0x00) values as data_ov000_021b55dc
 * (expected: both twin functions program the same object field). Only
 * bytes +0x0/+0x1 of this 6-byte symbol are dereferenced; the loop bound
 * (`cmp r8,#0x1`) pins r8 to 0 for the array's whole lifetime, and the
 * array's own stride is 2 bytes (`lsl #0x1`), so a hypothetical index 1
 * would read bytes +0x2/+0x3 -- exactly where the trailing 4 bytes below
 * sit -- but index 1 never executes. No reloc targets 0x021b55e0..
 * 0x021b55e3 either (checked both ov000's and main's relocs.txt: none),
 * and the trailing LE32 grouping (0x00000040 = 64) is far below the
 * 0x02000000-0x02400000 ARM9/overlay address range, so it is not a
 * pointer -- kept opaque, matching this exact family's own established
 * convention for undereferenced trailing words (see
 * src/overlay000/data_ov000_021b55e4.c, data_ov000_021b5600.c,
 * data_ov000_021b5614.c, data_ov000_021b561c.c, all of which type their
 * own not-dereferenced-by-the-one-known-reader trailing bytes as plain
 * scalars rather than guess a shape).
 *
 * Struct-layout note: the trailing 4 bytes are typed as two `short`
 * fields (f02/f04), NOT one `int`, even though as a whole LE32 word they
 * read as a single round value (0x40). An `int` field placed right after
 * two `unsigned char` fields would force mwcc to insert 2 bytes of
 * alignment padding before it (to reach the `int`'s required 4-byte
 * alignment relative to the struct's OWN start, which is only 2 bytes in
 * at that point) -- shifting it to relative offset +0x4 instead of the
 * real +0x2, inflating the struct to 8 bytes, and (because a struct's
 * alignment is the max of its members') forcing the compiler to insert 2
 * more padding bytes IN THE SECTION between data_ov000_021b55dc and
 * data_ov000_021b55de to satisfy the resulting 4-byte struct alignment --
 * silently breaking the byte-exact layout this whole recipe depends on.
 * EMPIRICALLY VERIFIED via a standalone scratch compile: the `int`
 * variant produced a 12-byte .rodata section (data_ov000_021b55de landed
 * at in-section offset 4, not 2 -- a real 2-byte gap) while the `short`
 * variant produced the correct 8-byte section with data_ov000_021b55de
 * at offset 2. `short` needs only 2-byte alignment, which relative
 * offset +0x2 already satisfies, so no padding is inserted anywhere.
 * Every existing sibling in this family avoids the issue only by
 * coincidence, not by having solved it: each of their leading
 * dereferenced fields is exactly 4 bytes -- either one pointer or two
 * `short`s -- so their trailing `int` fields always land on an
 * already-4-aligned relative offset. This is the first file in the
 * family with a 2-byte lead, so it's the first to need this called out
 * explicitly.
 *
 * Both symbols individually named per the proven recipe (not one opaque
 * array + padding); declared in address order; composed span verified
 * 4-aligned at both ends above.
 */

typedef struct {
    unsigned char a1;  /* +0x0, func_ov000_021ac508 arg a1 (0x07) */
    unsigned char a2;  /* +0x1, func_ov000_021ac508 arg a2 (0x00) */
} data_ov000_021b55dc_t;

const data_ov000_021b55dc_t data_ov000_021b55dc = { 0x07, 0x00 };

typedef struct {
    unsigned char a1;  /* +0x0, func_ov000_021ac508 arg a1 (0x07) */
    unsigned char a2;  /* +0x1, func_ov000_021ac508 arg a2 (0x00) */
    short f02;          /* +0x2, not dereferenced by the one known reader */
    short f04;          /* +0x4, not dereferenced by the one known reader */
} data_ov000_021b55de_t;

const data_ov000_021b55de_t data_ov000_021b55de = { 0x07, 0x00, 0x40, 0x00 };
