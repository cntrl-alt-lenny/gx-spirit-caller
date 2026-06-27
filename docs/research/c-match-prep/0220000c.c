/* CAMPAIGN-PREP candidate for func_0220000c (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     D: :6/:5/:1 bitfields for lsl;lsr extracts; (b0)*0x868+f5*0x14 table addr; plain (w>>5)&1; if-return guard
 *   risk:       struct-guessed: cf1ac field offsets/strides inferred from sibling 022575c8. Also mla r1,b0,0x868,base then ldr[r3,r1] - mwcc may fold f5*0x14 into one mla differently. reshape-able (inline f5*0x14).
 *   confidence: med
 */
/* func_ov002_0220000c (ov002, class D) - bitfield discriminant + table-word bit-gate + guard call.
 * Card +2 halfword = bitfield struct; table at cf1ac (word, stride 0x14, parity 0x868) confirmed by func_022575c8. */
extern unsigned char data_ov002_022cf1ac[];
extern int func_ov002_021bc8c8(int a, int b, int c);

typedef struct {
    unsigned short id0;
    unsigned short cb0  : 1;
    unsigned short cf5  : 5;
    unsigned short kind : 6;
    unsigned short cf12 : 2;
    unsigned short cb14 : 1;
    unsigned short cb15 : 1;
} Card;

int func_ov002_0220000c(Card *c) {
    if (c->kind != 2) return 1;
    {
        int b0 = c->cb0;
        int f5 = c->cf5;
        unsigned int w = *(unsigned int *)(data_ov002_022cf1ac + b0 * 0x868 + f5 * 0x14);
        if (((w >> 5) & 1) == 0) return 0;
        if (func_ov002_021bc8c8(b0, b0, f5) == 0) return 0;
    }
    return 1;
}
