/* data_ov009_021ada9c (12 bytes, 4-aligned): Ov009HitRect021ada90 --
 * element 11 of the data_ov009_021ada18-based array (0x021ada18 +
 * 11*12 = 0x021ada9c). Sibling of data_ov009_021ada90 -- see that file
 * for the full family/base-array writeup.
 * Two real consumers, same pattern as the sibling:
 *  1. func_ov009_021ac4d0.s (Ov009_Scene_Update), state 0: line 378
 *     `ldr r1,_LIT3` / `_LIT3: .word data_ov009_021ada9c` (line 688),
 *     `bl func_ov009_021ac458` at line 380 (AABB hit-test). relocs.txt:297
 *     `from:0x021ace50 kind:load to:0x021ada9c module:overlay(9)`.
 *  2. func_ov009_021ab9f8.s's 12-iteration sprite-draw loop (.L_3c0):
 *     this is the LAST iteration (n=11, r7 reaches 0xc and exits after),
 *     reading x@+0/y@+2/kind@+8/unkA@+0xa via the r8 pointer walked from
 *     data_ov009_021ada18 -- real, but not its own relocation (see
 *     primary sibling file for why).
 * .data-resident (non-const, same reasoning as sibling).
 */
typedef struct {
    unsigned short x, y, w, h;
    unsigned short kind;
    unsigned short unkA;
} Ov009HitRect021ada90;

Ov009HitRect021ada90 data_ov009_021ada9c = { 126, 126, 39, 28, 2, 0 };
