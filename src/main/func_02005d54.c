/* CAMPAIGN-PREP candidate for func_02005d54 (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     class D: if/else-if switch (cmp #1/#2), mla idx*12, store-order dst-then-slot
 *   risk:       reshape-able: switch lowering — mwcc may emit a jump/branch table or reorder the two cmp tests vs the asm's linear cmp#1/beq;cmp#2/beq;b. If it diverges, force order with nested if/else as written or explicit switch.
 *   confidence: med
 */
/* func_02005d54: select base table by arg2, then index two short arrays.
 *   base = (arg2==1)? data_02103d6c[0] : (arg2==2)? data_02103d6c[1] : 0;
 *   slot = (s16*)((char*)base + 0xa02 + arg1*2);
 *   src  = *slot;
 *   *(s16*)((char*)base + 0x408 + arg0*12) = src;   // mla r0*12, +0x400, [+8]
 *   *slot = (s16)arg0;
 * Store-order: write dst (+8) THEN write slot. r0=arg0,r1=arg1,r2=sel. */
extern void *data_02103d6c[2];

void func_02005d54(int idx, int slot_i, int sel) {
    char *base;
    short *slot;
    switch (sel) {
    case 1:  base = (char *)data_02103d6c[0]; break;
    case 2:  base = (char *)data_02103d6c[1]; break;
    default: base = 0; break;
    }
    slot = (short *)(base + slot_i * 2 + 0xa02);
    *(short *)(base + idx * 12 + 0x408) = *slot;
    *slot = (short)idx;
}
