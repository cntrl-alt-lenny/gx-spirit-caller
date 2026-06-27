/* CAMPAIGN-PREP candidate for func_02237bc0 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     bind off/s14 (reused 3x); coord unpack compare; unsigned V/10 -> umull 0xcccccccd>>3; store-order guards
 *   risk:       reshape-able: V is UNSIGNED so V/10 emits umull 0xcccccccd>>3 (signed int would give smull/wrong magic). Secondary permuter-class: 021d90c0(p) leftover-r0 arg is a guess; dense r2/r3/r4/r5 interleave may rotate regs.
 *   confidence: med
 */
/* CAMPAIGN-PREP candidate for func_ov002_02237bc0 (ov002, class D) — brief 494.
 * UNVERIFIED build-free draft. Coord-compare guard then umull /10 divmod guard.
 *   p=h2&1 ; s=(h2>>1)&0x1f ; off=p*0x868 (held); s14=s*0x14 (held)
 *   W=*(int*)(cf16c+off+s14+0x30)
 *   if(((h4>>6)&0x1ff) != ((W>>22 &0xff)<<1)+(W>>13 &1)) return 0;
 *   if(*(u16*)(cf1a4+off+s14)==0) return 0;
 *   V=*(int*)(cf1a8+off+s14);
 *   if(V/10 == 0x18c3)  021d59cc(p, s, h0, 3, [stack]0);   umull 0xcccccccd>>3
 *   else                021d90c0(p);                        r0=p leftover
 *   return 0
 * off and s14 are each computed once and reused across cf16c/cf1a4/cf1a8 (bind);
 * 021d90c0's only deliberately-live reg is r0=p (other args ambiguous). */
extern char data_ov002_022cf16c[];
extern char data_ov002_022cf1a4[];
extern char data_ov002_022cf1a8[];
extern void func_ov002_021d59cc(int p, int s, int h0, int three, int z);
extern void func_ov002_021d90c0(int p);

struct Obj_bc0 {
    unsigned short h0;
    unsigned short b0 : 1;
    unsigned short s5 : 5;
    unsigned short : 10;
    unsigned short : 6;
    unsigned short h4c : 9;        /* +4 bits6..14 coord LHS */
};
struct Rec_bc0 { unsigned int : 13; unsigned int c13 : 1; unsigned int : 8; unsigned int c22 : 8; };

int func_ov002_02237bc0(struct Obj_bc0 *o) {
    int p = o->b0 & 1;
    int s = o->s5;
    int off = p * 0x868;
    int s14 = s * 0x14;
    unsigned int W = *(unsigned int *)((char *)data_ov002_022cf16c + off + s14 + 0x30);
    unsigned int V;                    /* unsigned -> umull magic, not smull */

    if (o->h4c != (((struct Rec_bc0 *)&W)->c22 << 1) + ((struct Rec_bc0 *)&W)->c13)
        return 0;
    if (*(unsigned short *)((char *)data_ov002_022cf1a4 + off + s14) == 0)
        return 0;
    V = *(unsigned int *)((char *)data_ov002_022cf1a8 + off + s14);
    if (V / 10 == 0x18c3)
        func_ov002_021d59cc(p, s, o->h0, 3, 0);
    else
        func_ov002_021d90c0(p);
    return 0;
}
