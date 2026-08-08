/* data_ov016_021b9198 / _021b91a2 (0x021b9198-0x021b91ac, 20 bytes total):
 * TU-composition carve of 2 adjacent 2-byte-misaligned Ov016TouchCellSm
 * records, per docs/research/alignment-wall-tu-composition-recipe.md.
 * These are elements [2..3] of the SAME logical stride-10 touch-cell
 * array as the sibling file data_ov016_021b9184.c (elements [0..1]) and
 * the already-shipped data_ov016_021b91ac.c (elements [4..14]).
 *
 * SPLIT FROM A 4-SYMBOL BUNDLE: this run and _021b9184/_021b918e (in the
 * sibling file data_ov016_021b9184.c) were originally investigated and
 * drafted as ONE 4-symbol, 40-byte TU. Compiling that draft and
 * inspecting the .o symbol table (per the recipe doc's explicit
 * "spot-test a 3+ symbol group for reordering" warning) showed mwcc does
 * NOT preserve declaration order at n=4 -- see data_ov016_021b9184.c's
 * own header comment for the full finding. Since 0x021b9198 is itself
 * 4-aligned, the bundle splits cleanly into two independently
 * both-ends-passing n=2 TUs instead.
 *
 * Why composition is still required at n=2: each of these 2 symbols is
 * individually a 10-byte .data object (10 % 4 != 0), which alone triggers
 * the ALIGNALL(2) linker cascade. Declaring both as separate named
 * globals of one 10-byte record type, in address order, in this ONE file
 * makes the combined .data span exactly 0x021b9198-0x021b91ac (20 bytes,
 * a 4-byte multiple) with BOTH ends 4-aligned:
 *   data_ov016_021b9198  0x021b9198 (%4==0) .. 0x021b91a2 (%4==2)  10B
 *   data_ov016_021b91a2  0x021b91a2 (%4==2) .. 0x021b91ac (%4==0)  10B
 *   combined span         0x021b9198 (%4==0) .. 0x021b91ac (%4==0)  20B
 *
 * Type + field offsets: identical evidenced shape as the sibling file
 * data_ov016_021b9184.c -- see that file's header comment for the full
 * field-by-field citation (func_ov016_021b287c.s / func_ov016_021b28f4.s
 * hit-test bodies, func_ov016_021b3498.c draw-forward).
 *
 * Per-symbol consumer evidence (cross-checked against
 * docs/research/data/cm-data-restock-census-2026-08-03.md's independent
 * reader counts: 9198/91a2=1 reader each -- matches exactly), both from
 * src/overlay016/func_ov016_021b423c.s (whole-function .s, unmatched,
 * the same "case N" dispatch already documented in the sibling file):
 *  - data_ov016_021b9198 (1 reader): literal-pool slot _LIT7
 *    (relocs.txt:353, from:0x021b47a0) -- "case 2" arm (lines 162-175).
 *  - data_ov016_021b91a2 (1 reader): literal-pool slot _LIT9
 *    (relocs.txt:355, from:0x021b47a8) -- "case 3" arm, case value
 *    computed from a `data_02104f4c[1]` bitfield rather than a plain
 *    constant (lines 176-194).
 *
 * Values line up with the already-shipped neighbor: elements [2]
 * (w=39,h=28,y=123) shares w/h/y with data_ov016_021b91ac.c's row-123
 * entries [5]/[6] (x stepping by 45px), and element [3] (x=172,w=49)
 * shares x and w with that file's entry [4] (x=172,w=49) -- consistent
 * with one continuous on-screen button grid split across these files
 * purely by dsd's literal-vs-loop boundary deduction, not by any real
 * semantic seam.
 *
 * Section: config/eur/arm9/overlays/ov016/delinks.txt:5 `.data
 * start:0x021b8f80 end:0x021b9740` -- this run falls entirely inside, so
 * neither field may be `const`.
 *
 * No field value in either record falls in the 0x02000000-0x02400000
 * ARM9/overlay address range (largest value is 0x00ac); relocs.txt confirms
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
                       * and data_ov016_021b9184.c's type */

Ov016TouchCellSm data_ov016_021b9198 = { 127, 123, 39, 28, 2, 0 };
Ov016TouchCellSm data_ov016_021b91a2 = { 172,  89, 49, 62, 2, 0 };
