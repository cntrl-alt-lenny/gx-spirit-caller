/* data_ov016_021b9184 / _021b918e (0x021b9184-0x021b9198, 20 bytes total):
 * TU-composition carve of 2 adjacent 2-byte-misaligned Ov016TouchCellSm
 * records, per docs/research/alignment-wall-tu-composition-recipe.md.
 * These are elements [0..1] of the SAME logical stride-10 touch-cell
 * array whose elements [4..14] are already shipped as the 11-entry
 * data_ov016_021b91ac.c, and elements [2..3] are the sibling file
 * data_ov016_021b9198.c (021b9184 + 4*10 == 021b91ac exactly; ov016_core.h
 * documents data_ov016_021b9184 itself as "record array, stride 10").
 *
 * SPLIT FROM A 4-SYMBOL BUNDLE: this run and _021b9198/_021b91a2 (now
 * data_ov016_021b9198.c) were originally investigated and drafted as ONE
 * 4-symbol, 40-byte TU. Compiling that draft and inspecting the .o symbol
 * table (per the recipe doc's explicit "spot-test a 3+ symbol group for
 * reordering" warning) showed mwcc does NOT preserve declaration order at
 * n=4: the compiled .data section came out as [_9198, _918e, _9184,
 * _91a2] instead of source order [_9184, _918e, _9198, _91a2], which
 * would have shipped every symbol's bytes at the wrong address. Since
 * 0x021b9198 (the midpoint) is itself 4-aligned, the bundle splits
 * cleanly into two independently both-ends-passing n=2 TUs instead --
 * matching this wave's other two n=4-bundles-that-had-to-split (see
 * data_ov005_021b1a44.c/_1aa8.c and data_ov017_021b80a0.c/_80b4.c).
 *
 * Why composition is still required at n=2: each of these 2 symbols is
 * individually a 10-byte .data object (10 % 4 != 0), which alone triggers
 * the ALIGNALL(2) linker cascade. Declaring both as separate named
 * globals of one 10-byte record type, in address order, in this ONE file
 * makes the combined .data span exactly 0x021b9184-0x021b9198 (20 bytes,
 * a 4-byte multiple) with BOTH ends 4-aligned:
 *   data_ov016_021b9184  0x021b9184 (%4==0) .. 0x021b918e (%4==2)  10B
 *   data_ov016_021b918e  0x021b918e (%4==2) .. 0x021b9198 (%4==0)  10B
 *   combined span         0x021b9184 (%4==0) .. 0x021b9198 (%4==0)  20B
 *
 * Type + field offsets (matches data_ov016_021b91ac.c's identically-shaped,
 * identically-named type exactly -- same array, confirmed independently
 * here via each element's own real consumers, not assumed from address
 * arithmetic alone): +0x0 x (u16), +0x2 y (u16), +0x4 w (u8), +0x5 h (u8),
 * +0x6 cellW (u16), +0x8 cellH (u16). Confirmed by the two hit-test
 * callees (byte-identical bodies):
 *   src/overlay016/func_ov016_021b287c.s:20,24,28,32 -- `ldrh r1,[r4]` (x),
 *     `ldrb r0,[r4,#0x4]` (w), `ldrh r1,[r4,#0x2]` (y), `ldrb r0,[r4,#0x5]`
 *     (h) -- point-in-rect hit test.
 *   src/overlay016/func_ov016_021b28f4.s:20,24,28,32 -- byte-identical reads.
 * and by the MATCHED draw-forward func_ov016_021b3498.c: `void
 * func_ov016_021b3498(void *arg0,int arg1,int arg2,unsigned short *arg3)`
 * reads `arg3[0]` (x,+0), `arg3[1]` (y,+2), `arg3[3]` (cellW,+6), `arg3[4]`
 * (cellH,+8) -> `func_0201e964(2,obj.unk44,coords,0,0,0,arg3[4],arg3[3],
 * 0,0,0,0)`.
 *
 * Per-symbol consumer evidence (cross-checked against
 * docs/research/data/cm-data-restock-census-2026-08-03.md's independent
 * reader counts: 9184=4 readers, 918e=1 reader -- matches exactly):
 *  - data_ov016_021b9184 (4 readers):
 *    1. src/overlay016/func_ov016_021b423c.s (whole-function .s, unmatched):
 *       literal-pool slot _LIT4 (relocs.txt:350, from:0x021b4794) is loaded
 *       as the direct base pointer for the "case 0" arm -- `mov r0,r4;
 *       bl func_ov016_021b287c` then `mov r3,r4; bl func_ov016_021b3498`
 *       (lines 124,137,145-147) -- the same shape entry [4]'s
 *       "constant-addressed" arm uses in data_ov016_021b91ac.c. The SAME
 *       pool slot is reused at line 216 (`ldr r5, _LIT4`) as the loop base
 *       for elements [5..14] (`add r0,r6,#5; mul r4,r0,fp[=0xa]; add
 *       r0,r5,r4`) -- this one TU's data anchors both the direct-literal
 *       arms (elements 0-4) and the generic loop (elements 5-14).
 *    2. src/overlay016/func_ov016_021b47c8.s (whole-function .s, unmatched):
 *       at `.L_940`, `ldr r0, _LIT8[=data_ov016_021b9184];
 *       bl func_ov016_021b28f4` (relocs.txt:388, from:0x021b4c10) -- direct
 *       hit-test of element [0] alone, then unconditionally calls
 *       func_ov016_021b5284 (next bullet) and, if that hit-test also
 *       misses, func_ov016_021b5244 (bullet after) -- both transitive
 *       callees traced below.
 *    3. src/overlay016/func_ov016_021b5284.s (whole-function .s, unmatched;
 *       transitive callee of func_ov016_021b47c8.s's `.L_940`): `ldr r7,
 *       _LIT0[=data_ov016_021b9184]` (relocs.txt:431, from:0x021b5388),
 *       loop `mla r0,r1,r6[=0xa],r7` with r1=idx+1, idx=0..13 ->
 *       `bl func_ov016_021b287c` -- walks elements [1..14].
 *    4. src/overlay016/func_ov016_021b5244.c (MATCHED; transitive callee of
 *       func_ov016_021b47c8.s's `.L_968`, relocs.txt:429,
 *       from:0x021b5280):
 *         struct Ov016Row { char data[10]; };
 *         extern struct Ov016Row data_ov016_021b9184[];
 *         for (i = 0; i < 14; i++)
 *             if (func_ov016_021b28f4(&data_ov016_021b9184[i + 1])) return 1;
 *       -- confirms the stride-10 shape directly in already-matched C,
 *       walking elements [1..14] via the OTHER hit-test sibling.
 *  - data_ov016_021b918e (1 reader): func_ov016_021b423c.s literal-pool slot
 *    _LIT6 (relocs.txt:352, from:0x021b479c) -- direct base pointer, "case
 *    1" arm, same hit-test-then-draw shape as element [0] (lines 148-161).
 *
 * Section: config/eur/arm9/overlays/ov016/delinks.txt:5 `.data
 * start:0x021b8f80 end:0x021b9740` -- this run falls entirely inside, so
 * neither field may be `const`.
 *
 * No field value in either record falls in the 0x02000000-0x02400000
 * ARM9/overlay address range (largest value is 0x00e4); relocs.txt confirms
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
} Ov016TouchCellSm;  /* 10 bytes; same shape/name as data_ov016_021b91ac.c's type */

Ov016TouchCellSm data_ov016_021b9184 = { 228, 165, 26, 26, 2, 0 };
Ov016TouchCellSm data_ov016_021b918e = {  82, 123, 39, 28, 2, 0 };
