/* cm-restock-carve-4 Part 1, run 2/2: TU-composition carve of ov022's
 * 2-symbol, both-ends-4-aligned run at 0x021ab8e4-0x021ab98c (168
 * bytes), screened PASS by docs/research/data/cm-restock-carve-4-2026-08-08.md
 * Part 1 (0x021ab8e4 start%4==0, 0x021ab98c end%4==0). Recipe:
 * docs/research/alignment-wall-tu-composition-recipe.md. ov022 has NO
 * ov022_core.h -- worked directly from consumer .s files, as wave 2/3
 * did for other headerless modules.
 *
 * data_ov022_021ab8e4 (26 bytes) and data_ov022_021ab8fe (142 bytes) are
 * both real, independently-addressed symbols. config/eur/arm9/overlays/
 * ov022/relocs.txt records 6 literal-pool loads of exactly these 2
 * addresses, from 4 functions -- ALL 4 use the identical addressing
 * formula `selector = data_02104f4c[+4] & 7` (via `lsl #0x1d; lsr
 * #0x1d`, i.e. keep the low 3 bits) then `recordBase = selector*0x1c
 * (28) + &data_ov022_021ab8e4`:
 *
 *   - src/overlay022/func_ov022_021aa758.s (relocs.txt:66-67): reads
 *     `*(short*)(&data_ov022_021ab8fe + selector*28)` first (line
 *     165-174, result fed to func_020b3870 alongside 0x28000), THEN
 *     loops ip=0..12 reading `*(short*)(recordBase + ip*2)` (line
 *     175-203, .L_244), comparing each to -1 (mvn r5,#0) and calling
 *     func_0207e638 when not -1.
 *   - src/overlay022/func_ov022_021aaa34.s (relocs.txt:93): loops
 *     r9=0..12 reading `*(short*)(recordBase + r9*2)` (line 91-110,
 *     .L_3c4), same -1 sentinel compare, feeding func_0207e638.
 *   - src/overlay022/func_ov022_021aabe8.s (relocs.txt:104-105): reads
 *     `*(short*)(&data_ov022_021ab8fe + selector*28)` into r1 (line
 *     103-113) and uses it AS A LOOP BOUND (`cmp r0,r1; blt`); loops
 *     r0=0..r1-1 reading `*(short*)(recordBase + r0*2)` (line 120-135,
 *     .L_628), and when that value != -1, uses it (shl 1) as an INDEX
 *     into data_ov022_021ab8a8 (line 128, `ldrh r3,[r4,r3]`, r4=
 *     &data_ov022_021ab8a8) -- this is the decisive cross-check: the
 *     already-shipped src/overlay022/data_ov022_021ab8a8.c's own header
 *     comment documents its 30-entry table being "indexed by a
 *     runtime-variable value freshly loaded each time from a sibling
 *     table (data_ov022_021ab8e4)" (written by an earlier wave, before
 *     this run's own investigation) -- independent corroboration that
 *     this data's values are meant to be indices 0-29.
 *   - src/overlay022/func_ov022_021aadf0.s (relocs.txt:121): reads
 *     `*(short*)(recordBase + 0)` once (line 60-70, feeds the same
 *     data_ov022_021ab8a8 lookup), then loops r5=0..12 reading
 *     `*(short*)(recordBase + r5*2)` AND peeking `+2` ahead (line
 *     76-267, .L_764) for a blend/interpolation calculation.
 *
 * Combining all 4 formulas proves the TRUE logical structure is ONE
 * array of 6 records of 28 bytes each (6*28 = 168 = the full combined
 * run), each record = 13 x signed 16-bit "slot" values (ldrsh
 * throughout, sign-extended and compared against a full -1, which only
 * works if the field itself is signed) followed by 1 x signed 16-bit
 * "count" (how many of the 13 slots the consumer should actually walk;
 * proven directly by func_ov022_021aabe8.s's use of it as a `blt` loop
 * bound). dsd's boundary deduction split this array at +26 bytes --
 * 2 bytes SHORT of the first record's 28-byte extent -- because at
 * least one function (021aabe8.s, and 021aa758.s too) references
 * `&data_ov022_021ab8e4 + 26` as ITS OWN literal-pool constant (the
 * per-record "count" field's address, `data_ov022_021ab8fe`) rather
 * than computing it from data_ov022_021ab8e4 via arithmetic -- exactly
 * the "dsd's boundary deduction split one logical structure into
 * multiple placeholder names" scenario this wave's kickoff flagged,
 * except the split lands MID-RECORD rather than on an element boundary
 * (unlike ov019's run 1 or data_ov016_021b9000's precedent, both of
 * which split cleanly between whole elements).
 *
 * Per-record slot values (0,1,2,3,-1,4,5,6,7,-1,-1,-1,-1 for the first
 * 4 records; 8,9,10,11,-1,12,13,14,15,16,17,18,-1 for record 4;
 * 19,20,21,-1,22,23,24,-1,25,26,27,28,29 for record 5) are all valid
 * indices into the neighboring data_ov022_021ab8a8[30] table (indices
 * 0-29 exactly span its 30 entries) or the -1 "empty slot" sentinel --
 * consistent with the cross-check above.
 *
 * Section: config/eur/arm9/overlays/ov022/delinks.txt:2 --
 * `.rodata start:0x021ab8a8 end:0x021ab98c` -- both addresses fall
 * inside .rodata, so both symbols ARE const. Both-ends alignment:
 * 0x021ab8e4%4==0, 0x021ab98c%4==0, combined span 168 bytes (a multiple
 * of 4) -- PASS per cm-restock-carve-4 Part 1's screen (row "ov022:
 * 021ab8e4,021ab8fe").
 *
 * No cross-overlay coincidental-address alias exists for either symbol
 * (whole-repo grep outside src/overlay022/ and config/.../ov022/ found
 * zero hits for both addresses).
 *
 * Bytes: extracted via extract_bytes.py from extract/eur/arm9_overlays/
 * ov022.bin (pristine), cross-checked MATCH against build/eur/build/
 * arm9_ov022.bin.
 *
 * OPEN VERIFICATION NOTE: the proven recipe tested exactly 2 SCALAR
 * globals of the IDENTICAL type in one TU. This file composes 2
 * DIFFERENT shapes -- a flat `short[13]` and a compound struct-of-
 * array-of-struct -- in one TU, a further extension beyond even run 1's
 * array variant. Needs the standard ninja/objdiff/sha1 gate before
 * shipping.
 */

typedef struct {
    short slot[13];   /* candidate/entry IDs; -1 = empty (ldrsh sign-compare) */
    short count;      /* number of slot[] entries the consumer actually walks */
} Ov022SlotRecord021ab8e4;   /* 28 bytes: matches the proven selector*0x1c stride */

typedef struct {
    short record0Count;                  /* record 0's "count" -- record 0's own
                                           * slot[13] is the SEPARATE global
                                           * data_ov022_021ab8e4 immediately
                                           * preceding this symbol; see header. */
    Ov022SlotRecord021ab8e4 record[5];   /* logical records 1-5, each complete */
} Ov022SlotTail021ab8fe;

const short data_ov022_021ab8e4[13] = {
    0, 1, 2, 3, -1, 4, 5, 6, 7, -1, -1, -1, -1,
};

const Ov022SlotTail021ab8fe data_ov022_021ab8fe = {
    9,
    {
        { { 0, 1, 2, 3, -1, 4, 5, 6, 7, -1, -1, -1, -1 }, 9 },
        { { 0, 1, 2, 3, -1, 4, 5, 6, 7, -1, -1, -1, -1 }, 9 },
        { { 0, 1, 2, 3, -1, 4, 5, 6, 7, -1, -1, -1, -1 }, 9 },
        { { 8, 9, 10, 11, -1, 12, 13, 14, 15, 16, 17, 18, -1 }, 12 },
        { { 19, 20, 21, -1, 22, 23, 24, -1, 25, 26, 27, 28, 29 }, 13 },
    },
};
