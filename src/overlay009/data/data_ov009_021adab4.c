/* data_ov009_021adab4 (12 bytes, 4-aligned): Ov009HitRect021ada90 --
 * element 13 of the data_ov009_021ada18-based array (0x021ada18 +
 * 13*12 = 0x021adab4). Sibling of data_ov009_021ada90 -- see that file
 * for the full family/base-array writeup.
 * One real consumer (draw only, not hit-tested -- matches census count
 * of 1):
 *  func_ov009_021ab9f8.s (Ov009_ScoreCtrl_DrawFrame): line 317
 *  `ldr r5,_LIT10` / `_LIT10: .word data_ov009_021adab4` (line 557).
 *  Reads x@+0/y@+2 (lines 318-319) and kind@+8/unkA@+0xa (lines
 *  343/339) -- identical field pattern to the family. relocs.txt:194
 *  `from:0x021ac1f4 kind:load to:0x021adab4 module:overlay(9)`.
 * .data-resident (non-const, same reasoning as sibling).
 */
typedef struct {
    unsigned short x, y, w, h;
    unsigned short kind;
    unsigned short unkA;
} Ov009HitRect021ada90;

Ov009HitRect021ada90 data_ov009_021adab4 = { 171, 58, 49, 28, 2, 0 };
