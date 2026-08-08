/* data_ov009_021adad8 (12 bytes, 4-aligned): Ov009HitRect021ada90 --
 * element 16 of the data_ov009_021ada18-based array (0x021ada18 +
 * 16*12 = 0x021adad8), the last element carved this wave (the next
 * element, n=17, is the already-carved data_ov009_021adae4, out of
 * scope). Sibling of data_ov009_021ada90 -- see that file for the full
 * family/base-array writeup.
 * One real consumer (draw only, not hit-tested -- matches census count
 * of 1):
 *  func_ov009_021ab9f8.s (Ov009_ScoreCtrl_DrawFrame): line 410
 *  `ldr r5,_LIT12` / `_LIT12: .word data_ov009_021adad8` (line 559).
 *  Reads x@+0/y@+2 (lines 412-413) and kind@+8/unkA@+0xa (lines
 *  425/421). relocs.txt:196 `from:0x021ac1fc kind:load to:0x021adad8
 *  module:overlay(9)`.
 * .data-resident (non-const, same reasoning as sibling).
 */
typedef struct {
    unsigned short x, y, w, h;
    unsigned short kind;
    unsigned short unkA;
} Ov009HitRect021ada90;

Ov009HitRect021ada90 data_ov009_021adad8 = { 129, 3, 15, 12, 2, 0 };
