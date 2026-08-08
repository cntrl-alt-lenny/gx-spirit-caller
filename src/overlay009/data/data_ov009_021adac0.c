/* data_ov009_021adac0 (12 bytes, 4-aligned): Ov009HitRect021ada90 --
 * element 14 of the data_ov009_021ada18-based array (0x021ada18 +
 * 14*12 = 0x021adac0). Sibling of data_ov009_021ada90 -- see that file
 * for the full family/base-array writeup.
 * TWO real consumers (matches the census's count of 2):
 *  1. func_ov009_021ab9f8.s (Ov009_ScoreCtrl_DrawFrame): line 376
 *     `ldr r4,_LIT11` / `_LIT11: .word data_ov009_021adac0` (line 558).
 *     Reads x@+0/y@+2 (lines 377-378) and kind@+8/unkA@+0xa (lines
 *     398/394). relocs.txt:195 `from:0x021ac1f8 kind:load to:0x021adac0
 *     module:overlay(9)`.
 *  2. func_ov009_021ac4d0.s (Ov009_Scene_Update), state 0, label .L_454
 *     (the FIRST of the three hit-tests tried in this state): line 333
 *     `ldr r1,_LIT1` / `_LIT1: .word data_ov009_021adac0` (line 686),
 *     `bl func_ov009_021ac458` at line 335 (AABB hit-test, reads
 *     x@0/w@4/y@2/h@6). relocs.txt:295 `from:0x021ace48 kind:load
 *     to:0x021adac0 module:overlay(9)`.
 * .data-resident (non-const, same reasoning as sibling).
 */
typedef struct {
    unsigned short x, y, w, h;
    unsigned short kind;
    unsigned short unkA;
} Ov009HitRect021ada90;

Ov009HitRect021ada90 data_ov009_021adac0 = { 227, 164, 26, 26, 2, 0 };
