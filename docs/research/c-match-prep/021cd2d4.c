/* CAMPAIGN-PREP candidate for func_021cd2d4 (ov011, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     Class D: bitfield extract as (x<<23)>>28; mla index base+k*4; halfword loads <<12; preserve store order.
 *   risk:       reshape-able/struct-guessed: row extract is read from a global word, not a struct, so (state<<23)>>28 may fold to lsr;and not lsl;lsr -- confirm vs real bitfield struct at 0x2a4.
 *   confidence: med
 */
/* func_ov011_021cd2d4 (ov011, class D): mla-indexed table lookup with bitfield
 * row select and two halfword stores.
 *   row   = ((state>>5)&0xf) - 1   where state = *(u32*)(021d4000+0x2a4),
 *           extracted as (state<<23)>>28 to drive the orig lsl#17/lsr#1c pair.
 *   k = func_ov011_021cd268(arg0); if (k == -1) return 0;
 *   base = row*0x72; col = k.
 *   *outA = ((u16)data_021d3374[col*4 + base]) << 12;
 *   *outB = ((u16)data_021d3376[col*4 + base]) << 12;
 *   return data_021d3394[k + base];   (byte)
 * NOTE the two .word tables 021d3374 / 021d3376 are 2 bytes apart -> almost
 * certainly two u16 fields of one struct; modelled as separate base symbols to
 * mirror the two _LIT loads. */
extern int func_ov011_021cd268(int arg0);
extern unsigned char data_ov011_021d4000[];
extern unsigned char data_ov011_021d3374[];
extern unsigned char data_ov011_021d3376[];
extern unsigned char data_ov011_021d3394[];

int func_ov011_021cd2d4(int arg0, int *outA, int *outB) {
    unsigned int state;
    int row;
    int k;
    int base;
    unsigned short a;
    unsigned short b;

    state = *(unsigned int *)(data_ov011_021d4000 + 0x2a4);
    row = (int)((state << 23) >> 28) - 1;

    k = func_ov011_021cd268(arg0);
    if (k == -1)
        return 0;

    base = row * 0x72;
    a = *(unsigned short *)(data_ov011_021d3374 + k * 4 + base);
    b = *(unsigned short *)(data_ov011_021d3376 + k * 4 + base);
    *outA = (int)a << 12;
    *outB = (int)b << 12;
    return data_ov011_021d3394[k + base];
}
