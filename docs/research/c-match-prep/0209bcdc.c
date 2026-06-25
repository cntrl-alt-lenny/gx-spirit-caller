/* CAMPAIGN-PREP candidate for func_0209bcdc (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     guard early-return; clear order 0,4,0x1c,8,0xc verbatim; spin invariants 5/1 in r5/r4
 *   risk:       Clear order 0,4,0x1c,8,0xc places 0x1c BEFORE 8/0xc; if mwcc sorts by offset, field_1c moves last, reordering 3 str. reshape-able (reorder C statements to match asm). Offsets struct-guessed.
 *   confidence: med
 */
/* func_0209bcdc: init guard + field clears + channel-spin retry loop. */

extern unsigned short data_021a8434;

typedef struct {
    /* 0x00 */ int field_0;
    /* 0x04 */ int field_4;
    /* 0x08 */ int field_8;
    /* 0x0c */ int field_c;
    /* 0x10 */ char pad_10[0xc];
    /* 0x1c */ int field_1c;
} Struct_021a8438;
extern Struct_021a8438 data_021a8438;

extern void func_02096228(void);
extern int  func_0209640c(int ch, int on);
extern void func_02096434(int ch, void *cb);
extern void func_0209b5e0(void);

void func_0209bcdc(void) {
    if (data_021a8434 != 0) return;
    data_021a8434 = 1;
    data_021a8438.field_0  = 0;
    data_021a8438.field_4  = 0;
    data_021a8438.field_1c = 0;
    data_021a8438.field_8  = 0;
    data_021a8438.field_c  = 0;
    func_02096228();
    while (func_0209640c(5, 1) == 0)
        ;
    func_02096434(5, (void *)func_0209b5e0);
}
