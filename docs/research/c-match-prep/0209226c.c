/* CAMPAIGN-PREP candidate for func_0209226c (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     CLASS D store-order: header fields first, then 14 zeros in exact offset order
 *   risk:       reshape-able: the `tst r2,#4 / subne` masks bit2 of (end-0x40) — must stay if-test-subtract, not `end &= ~4` (that would emit bic). x00 if-assign (movne#3f/moveq#1f) must stay if/else not ternary. Confirm field 0x38/0x3c gap is just skipped-then-stored.
 *   confidence: med
 */
/* CAMPAIGN-PREP candidate for func_0209226c (main, class D, MED tier) — EUR .s front-load.
 * UNVERIFIED + ITERATION-EXPECTED: class-D zero-store block.
 *   recipe:     CLASS D store-order: compute header fields (x40/x44/x38/x00) first, then 14 zero stores in EXACT asm offset order (4,8,c,10,14,18,1c,20,24,28,2c,30,34,3c)
 *   risk:       see header below
 * func_0209226c(obj, base, end):  ring/queue header init.
 *   base += 4;
 *   obj->x40 = base;
 *   obj->x44 = end;
 *   end -= 0x40; if (end & 4) end -= 4; obj->x38 = end;
 *   obj->x00 = (base & 1) ? 0x3f : 0x1f;
 *   obj->x04..x34 = 0 (skipping 0x38/0x3c handled separately), then obj->x3c = 0.
 * Store order in asm: x04,x08,x0c,x10,x14,x18,x1c,x20,x24,x28,x2c,x30,x34,x3c.
 */

typedef struct Ring {
    int x00;             /* 0x00 */
    int x04;             /* 0x04 */
    int x08; int x0c; int x10; int x14; int x18; int x1c;
    int x20; int x24; int x28; int x2c; int x30; int x34;
    int x38;             /* 0x38 */
    int x3c;             /* 0x3c */
    unsigned int x40;    /* 0x40 */
    unsigned int x44;    /* 0x44 */
} Ring;

void func_0209226c(Ring *obj, unsigned int base, unsigned int end) {
    base += 4;
    obj->x40 = base;
    obj->x44 = end;
    end -= 0x40;
    if (end & 4)
        end -= 4;
    obj->x38 = end;
    if (base & 1)
        obj->x00 = 0x3f;
    else
        obj->x00 = 0x1f;
    obj->x04 = 0;
    obj->x08 = 0;
    obj->x0c = 0;
    obj->x10 = 0;
    obj->x14 = 0;
    obj->x18 = 0;
    obj->x1c = 0;
    obj->x20 = 0;
    obj->x24 = 0;
    obj->x28 = 0;
    obj->x2c = 0;
    obj->x30 = 0;
    obj->x34 = 0;
    obj->x3c = 0;
}
