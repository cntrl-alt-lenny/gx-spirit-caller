/* data_ov009_021adaa8 (12 bytes, 4-aligned): Ov009HitRect021ada90 --
 * element 12 of the data_ov009_021ada18-based array (0x021ada18 +
 * 12*12 = 0x021adaa8). Sibling of data_ov009_021ada90 -- see that file
 * for the full family/base-array writeup.
 * One real consumer (matches the census's count of 1 -- unlike ada90/
 * ada9c/adac0/adacc, this one is NOT hit-tested by func_ov009_021ac4d0,
 * only drawn):
 *  func_ov009_021ab9f8.s (Ov009_ScoreCtrl_DrawFrame), right after the
 *  12-slot loop: line 256 `ldr r5,_LIT8` / `_LIT8: .word
 *  data_ov009_021adaa8` (line 555). Reads x@+0/y@+2 (lines 258-259) and
 *  kind@+8/unkA@+0xa (lines 287/283) -- identical field pattern to the
 *  sibling. relocs.txt:192 `from:0x021ac1ec kind:load to:0x021adaa8
 *  module:overlay(9)` (this address is inside func_ov009_021ab9f8's own
 *  range 0x021ab9f8-0x021ac214).
 * NOTE: a same-address hit `to:0x021adaa8 module:overlay(8)` also
 * appears in config/eur/arm9/overlays/ov008/relocs.txt -- verified
 * FALSE POSITIVE: ov008/symbols.txt shows `func_ov008_021adaa8
 * kind:function(arm,size=0x114) addr:0x021adaa8`, ov008's OWN function
 * at that numeric address (ov008 and ov009 both base `.text` at
 * 0x021aa4a0, an overlay-swap address-aliasing pair per
 * ov009_core.h) -- not a real cross-module reader of this symbol.
 * .data-resident (non-const, same reasoning as sibling).
 */
typedef struct {
    unsigned short x, y, w, h;
    unsigned short kind;
    unsigned short unkA;
} Ov009HitRect021ada90;

Ov009HitRect021ada90 data_ov009_021adaa8 = { 171, 92, 49, 62, 2, 0 };
