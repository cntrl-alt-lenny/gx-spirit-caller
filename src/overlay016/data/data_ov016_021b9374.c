/* data_ov016_021b9374 (0x021b9374-0x021b939c, 40 bytes total): TU-composition
 * carve of 2 adjacent 2-byte-misaligned records, per
 * docs/research/alignment-wall-tu-composition-recipe.md. Screened PASS in
 * docs/research/data/cm-restock-carve-4-2026-08-08.md Part 1 (both-ends
 * check: start%4==0, end%4==0). Unlike the data_ov016_021b9184 run (sibling
 * file in this directory), these two symbols are NOT elements of one shared
 * array -- they are independently-addressed, differently-sized records that
 * merely happen to be adjacent and both satisfy the both-ends-4-aligned
 * composition precondition. Already noted as a pre-existing "2 HitRect
 * records, confirmed SHARED between 021b6350 and 021b6688" pair in
 * docs/research/retriage/Ov011Ov016Ov010Ov005RetriageR9.md:294-295 (that
 * doc's "HitRect" is informal/generic -- the real field evidence below
 * shows the true shape is this address neighborhood's own 10-byte
 * Ov016TouchCellSm, not literally docs/research/types/HitRect.md's 12-byte
 * x/y/w/h/pad[4]/attr type, which belongs to ov014).
 *
 * Why composition is required: data_ov016_021b9374 is a 10-byte .data
 * object (10 % 4 != 0) and data_ov016_021b937e is a 30-byte .data object
 * (30 % 4 != 0) -- each alone triggers the ALIGNALL(2) linker cascade.
 * Declaring both as separate named globals of their own respective types,
 * in address order, in this ONE file makes the combined .data span exactly
 * 0x021b9374-0x021b939c (40 bytes, a 4-byte multiple) with BOTH ends
 * 4-aligned:
 *   data_ov016_021b9374  0x021b9374 (%4==0) .. 0x021b937e (%4==2)  10B
 *   data_ov016_021b937e  0x021b937e (%4==2) .. 0x021b939c (%4==0)  30B
 *   combined span        0x021b9374 (%4==0) .. 0x021b939c (%4==0)  40B
 * (data_ov016_021b939c immediately follows -- ov016_core.h documents it as
 * the unrelated "number-format glyph table (OS_SPrintf)"; out of scope.)
 *
 * Consumers (2, per docs/research/data/cm-data-restock-census-2026-08-03.md
 * readers column for both symbols -- matches exactly):
 *  - src/overlay016/func_ov016_021b6350.s (whole-function .s, unmatched):
 *    loads data_ov016_021b9374 into r6 (_LIT2, relocs.txt:546,
 *    from:0x021b6674) -> `bl func_ov016_021b287c` (hit-test) -> `mov
 *    r3,r6; mov r1,#0xe[=14]; bl func_ov016_021b3594` (draw-forward, lines
 *    29-47); then loads data_ov016_021b937e into r5 (_LIT5, relocs.txt:549,
 *    from:0x021b6680) -> same hit-test -> `mov r3,r5;
 *    bl func_ov016_021b3594` (lines 48-70). Both records are used
 *    identically -- always as a bare base pointer, never with any offset
 *    arithmetic.
 *  - src/overlay016/func_ov016_021b6688.s (whole-function .s, unmatched):
 *    `ldr r0, _LIT9[=data_ov016_021b9374]; bl func_ov016_021b28f4`
 *    (relocs.txt:611, from:0x021b6efc, lines 525-533), then `ldr r0,
 *    _LIT10[=data_ov016_021b937e]; bl func_ov016_021b28f4` (relocs.txt:612,
 *    from:0x021b6f00, lines 535-543) -- again a bare base pointer each,
 *    feeding a boolean into func_ov016_021b6f08 (which only receives a
 *    small state index, 0 or 1, never the record pointer itself -- traced
 *    and confirmed NOT a structural consumer of either record's bytes).
 *
 * Field offsets for data_ov016_021b9374 (10 bytes -- the same
 * Ov016TouchCellSm shape as the sibling data_ov016_021b9184.c run) are
 * confirmed the same way as that file: src/overlay016/func_ov016_021b287c.s
 * :20,24,28,32 / src/overlay016/func_ov016_021b28f4.s:20,24,28,32
 * (hit-test: x,w,y,h at +0/+4/+2/+5), and src/overlay016/func_ov016_021b3594.c
 * (MATCHED, sibling of the matched 021b3560): reads a3[0] (x,+0) and a3[1]
 * (y,+2), each offset by a stack arg, and a3[3] (cellW,+6) / a3[4]
 * (cellH,+8) verbatim, then forwards a packed short buffer to
 * func_ov016_021b3498 (a3[2] -- the +4/+5 w/h byte pair read as a u16 -- is
 * never read here; w/h only feed the hit-test):
 *     void func_ov016_021b3594(int a0, int a1, int a2, unsigned short *a3,
 *                               int a4, int a5) {
 *         short s[6];
 *         s[0] = a3[0] + a4;
 *         s[1] = a3[1] + a5;
 *         s[3] = a3[3];
 *         s[4] = a3[4];
 *         func_ov016_021b3498(a0, a1, a2, s);
 *     }
 *
 * data_ov016_021b937e (30 bytes) is passed to the SAME two functions the
 * SAME way (bare base pointer, never offset), so only its first 10 bytes
 * are consumer-proven to be one more Ov016TouchCellSm record. The
 * remaining 20 bytes are NOT read by any traced consumer at all --
 * relocs.txt shows exactly one literal-pool relocation to this symbol's
 * base address in each of its two reader functions (021b6350 line 549,
 * 021b6688 line 612), never to +10 or +20 within it, and no third reader
 * exists anywhere in config/eur/arm9/overlays/ov016/relocs.txt. That said,
 * the real bytes at +10 and +20 decode byte-for-byte as two more
 * well-formed Ov016TouchCellSm records (small plausible x/y/w/h/cellW
 * values, cellH=0 like every other record in this neighborhood) and the
 * 30-byte size divides evenly by 10 with no padding remainder, so they are
 * typed the same way below for honesty/readability rather than flattened
 * to raw bytes -- but flagged plainly here and inline: cell[1] and cell[2]
 * are PATTERN-MATCHED ONLY, not consumer-traced.
 *
 * Section: config/eur/arm9/overlays/ov016/delinks.txt:5 `.data
 * start:0x021b8f80 end:0x021b9740` -- this run falls entirely inside, so
 * neither global may be `const`.
 *
 * No field value in either record falls in the 0x02000000-0x02400000
 * ARM9/overlay address range (largest value is 0x00e8); relocs.txt confirms
 * no relocation originates from any offset inside this span, so none are
 * pointers.
 */
typedef struct {
    unsigned short x;
    unsigned short y;
    unsigned char  w;
    unsigned char  h;
    unsigned short cellW;
    unsigned short cellH;
} Ov016TouchCellSm;  /* 10 bytes; same shape/name as data_ov016_021b91ac.c's
                       * and this directory's data_ov016_021b9184.c's type */

Ov016TouchCellSm data_ov016_021b9374 = { 228, 165, 26, 26, 2, 0 };

Ov016TouchCellSm data_ov016_021b937e[3] = {
    { 164, 165, 26, 26, 2, 0 },  /* [0]: consumer-proven, see header comment */
    { 232,   8, 24, 20, 1, 0 },  /* [1]: PATTERN-MATCHED ONLY -- not read by any traced consumer */
    { 232, 131, 24, 20, 1, 0 },  /* [2]: PATTERN-MATCHED ONLY -- not read by any traced consumer */
};
