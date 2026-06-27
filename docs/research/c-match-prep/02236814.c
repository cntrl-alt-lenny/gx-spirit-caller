/* CAMPAIGN-PREP candidate for func_02236814 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     two store-ordered :1 bitfield inserts into h4; coord :8/:1 unpack compare; tail-call guard
 *   risk:       struct-guessed: the strh;ldrh;strh pair is a self-referencing insert (orr|2;bic~4 -> NET |0xE). My two h4f2=h4f3=1 likely won't reproduce the exact orr/bic insert bytes; confirm h4 field layout + insert semantics.
 *   confidence: low
 */
/* CAMPAIGN-PREP candidate for func_ov002_02236814 (ov002, class D) — brief 494.
 * UNVERIFIED build-free draft. Two RMW bitfield inserts into obj h4 (strh;ldrh;
 * strh pair, NET h4|=0xE done as separate field writes), then coord-unpack
 * compare guard, then conditional tail call.
 *   h4 fields: set bit2-region (insert1), set bit3-region (insert2) [store-order!]
 *   p=h2&1 ; s=(h2>>1)&0x1f ; W=*(int*)(cf16c + p*0x868 + s*0x14 + 0x30)
 *   LHS=(h4>>6)&0x1ff ; RHS=((W>>22)&0xff)<<1 + ((W>>13)&1)
 *   if(LHS==RHS){ 021d8904(); 021de910(o [r5=orig r0], h2&1, (h2>>1)&0x1f); }
 *   return 0
 * 021de910 args: r0=r5(saved obj), r1=h2&1, r2=(h2>>1)&0x1f, r3=h2... (r3 from
 * (h2<<0x1f)>>0x1f = h2&1 -- see asm "mov r3,r1,lsl#0x1f"). */
extern char data_ov002_022cf16c[];   /* record base, 0x868 parity stride, 0x14 stride */
extern void func_ov002_021d8904(void);
extern int  func_ov002_021de910(void *o, int a, int b);

struct Obj814 {
    unsigned short h0;                 /* +0 */
    unsigned short b0 : 1;             /* +2 bit0  : parity p     */
    unsigned short s5 : 5;             /* +2 bits1..5 : slot s    */
    unsigned short : 10;
    unsigned short h4f1 : 2;           /* +4 bits0..1            */
    unsigned short h4f2 : 1;           /* +4 bit2 (insert1)      */
    unsigned short h4f3 : 1;           /* +4 bit3 (insert2)      */
    unsigned short h4f6 : 9;           /* +4 bits6..14 : coord LHS */
};
struct Rec814 { unsigned int : 13; unsigned int c13 : 1; unsigned int : 8; unsigned int c22 : 8; };

int func_ov002_02236814(void *obj, struct Obj814 *o) {
    unsigned int W;
    int lhs, rhs;

    o->h4f2 = 1;                       /* insert1: strh */
    o->h4f3 = 1;                       /* insert2: ldrh;strh */
    W = *(unsigned int *)((char *)data_ov002_022cf16c +
                          (o->b0 & 1) * 0x868 + o->s5 * 0x14 + 0x30);
    lhs = o->h4f6;
    rhs = (((struct Rec814 *)&W)->c22 << 1) + ((struct Rec814 *)&W)->c13;
    if (lhs == rhs) {
        func_ov002_021d8904();
        func_ov002_021de910(obj, o->b0 & 1, o->s5);
    }
    return 0;
}
