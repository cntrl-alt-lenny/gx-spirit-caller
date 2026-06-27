/* CAMPAIGN-PREP candidate for func_02208a5c (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     twin of 022085a0; f14 :1 movs-test; idx9*4 ushort table; &0x1fff shift-pair; bool return
 *   risk:       idx9*4 table scale fusion (lsl#0x17;lsr#0x15) — bitfield + *2 likely 3 shifts not 2. reshape-able (4-byte-stride table) else permuter-class. Same fix propagates to 022085a0.
 *   confidence: low
 */
/* func_ov002_02208a5c (ov002, D) — bitfield extracts feeding call; twin of
 * 022085a0 but a bool-returning leaf (no flag0 cross-check, no tail call).
 *   type6=(attr>>6)&0x3f ; if(type6 != 0x16) return 0
 *   w14=word@+0x14 ; if(((w14>>14)&1) == 0) return 0       (movs/moveq: f14)
 *   if(((w14>>19)&0xf) != 0xe) return 0
 *   idx9=w14&0x1ff ; v=data_022d0250[idx9] (byte off idx9*4) & 0x1fff
 *   return func_0202e234(v) ? 1 : 0.
 * idx*4 on ushort table => [idx9*2]. */
struct Obj {
    unsigned short u0;
    unsigned short flag0 : 1, : 5, type6 : 6, : 4;     /* +0x2 */
    unsigned short u4;
    char pad6[0x14 - 0x6];
    unsigned idx9 : 9, : 5, f14 : 1, : 4, f19 : 4, : 9; /* +0x14 */
};

extern unsigned short data_ov002_022d0250[];
extern int func_0202e234(int);

int func_ov002_02208a5c(struct Obj *card) {
    if (card->type6 != 0x16) return 0;
    if (card->f14 == 0) return 0;
    if (card->f19 != 0xe) return 0;
    return func_0202e234(data_ov002_022d0250[card->idx9 * 2] & 0x1fff) != 0;
}
