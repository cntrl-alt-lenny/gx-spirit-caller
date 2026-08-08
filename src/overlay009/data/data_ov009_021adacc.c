/* data_ov009_021adacc (12 bytes, 4-aligned): Ov009HitRect021ada90 --
 * element 15 of the data_ov009_021ada18-based array (0x021ada18 +
 * 15*12 = 0x021adacc). Sibling of data_ov009_021ada90 -- see that file
 * for the full family/base-array writeup.
 * TWO real consumers (matches the census's count of 2), and the ONLY
 * sibling with kind=0 (all others in this wave have kind=2) -- both of
 * its consumers are conditionally gated on `func_0202cdf8()` returning
 * non-zero, unlike every other sibling:
 *  1. func_ov009_021ab9f8.s (Ov009_ScoreCtrl_DrawFrame), inside the
 *     `if (func_0202cdf8()) { ... }` block (line 506-508): line 509
 *     `ldr r4,_LIT17` / `_LIT17: .word data_ov009_021adacc` (line 564).
 *     Reads x@+0/y@+2 (lines 510-511) and kind@+8/unkA@+0xa (lines
 *     531/527). relocs.txt:198 `from:0x021ac210 kind:load to:0x021adacc
 *     module:overlay(9)`.
 *  2. func_ov009_021ac4d0.s (Ov009_Scene_Update), state 2 (.L_8dc,
 *     "animate-out" per docs/research/map/overlay009.md), also inside an
 *     `if (func_0202cdf8()) { ... }` guard: line 647 `ldr r1,_LIT6` /
 *     `_LIT6: .word data_ov009_021adacc` (line 691), `bl
 *     func_ov009_021ac458` at line 649 (AABB hit-test). relocs.txt:300
 *     `from:0x021ace5c kind:load to:0x021adacc module:overlay(9)`.
 * This state-2/conditional gating plus the distinct kind=0 strongly
 * suggests this rect is a special/optional tap target (e.g. a
 * skip-animation region), only active under the same runtime condition
 * in both its draw and hit-test paths -- consistent with, not
 * contradicting, the shared Ov009HitRect021ada90 layout.
 * .data-resident (non-const, same reasoning as sibling).
 */
typedef struct {
    unsigned short x, y, w, h;
    unsigned short kind;
    unsigned short unkA;
} Ov009HitRect021ada90;

Ov009HitRect021ada90 data_ov009_021adacc = { 227, 0, 29, 20, 0, 0 };
