/* CAMPAIGN-PREP candidate for func_02236cc4 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     bind p*0x868 + s*0x14 products once (reused 2x); coord :8/:1 unpack compare; tail-call
 *   risk:       reshape-able: orig HOLDS r2=p*0x868 and r3=s*0x14 across both the cf16c and cf1a4 reads. If mwcc recomputes either product for the 2nd read, 1-2 mul/add diverge — bind into locals (as written) to match.
 *   confidence: med
 */
/* CAMPAIGN-PREP candidate for func_ov002_02236cc4 (ov002, class D) — brief 494.
 * UNVERIFIED build-free draft. Coord-bitfield validate then tail-call (clean).
 *   p=h2&1 ; s=(h2>>1)&0x1f
 *   W=*(int*)(cf16c + p*0x868 + s*0x14 + 0x30)
 *   if( ((h4>>6)&0x1ff) != ((W>>22 &0xff)<<1)+(W>>13 &1) ) return 0;
 *   if( *(u16*)(cf1a4 + p*0x868 + s*0x14) == 0 ) return 0;
 *   return func_02210104(obj);     // tail, r0 = original obj
 * The p*0x868 product (r2) is held and reused for both cf16c read and the cf1a4
 * read; s*0x14 (r3) likewise reused -> matches asm (bind these two products). */
extern char data_ov002_022cf16c[];
extern char data_ov002_022cf1a4[];
extern int  func_ov002_02210104(void *o);

struct Obj_cc4 {
    unsigned short h0;
    unsigned short b0 : 1;
    unsigned short s5 : 5;
    unsigned short : 10;
    unsigned short : 6;
    unsigned short h4c : 9;     /* +4 bits6..14 : coord LHS */
};
struct Rec_cc4 { unsigned int : 13; unsigned int c13 : 1; unsigned int : 8; unsigned int c22 : 8; };

int func_ov002_02236cc4(struct Obj_cc4 *o) {
    int p = o->b0 & 1;
    int s = o->s5;
    unsigned int W = *(unsigned int *)((char *)data_ov002_022cf16c + p * 0x868 + s * 0x14 + 0x30);

    if (o->h4c != (((struct Rec_cc4 *)&W)->c22 << 1) + ((struct Rec_cc4 *)&W)->c13)
        return 0;
    if (*(unsigned short *)((char *)data_ov002_022cf1a4 + p * 0x868 + s * 0x14) == 0)
        return 0;
    return func_ov002_02210104(o);
}
