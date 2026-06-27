/* CAMPAIGN-PREP candidate for func_022368e8 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     clone of 02236814; same store-ordered h4 inserts + coord unpack; tail 021d63fc(.,.,.,0)
 *   risk:       struct-guessed: same self-referencing strh;ldrh;strh insert pair as 02236814 — the orr/bic insert bytes are the likely diff. 4th call arg is literal 0 (not h2). Confirm insert + h4 layout.
 *   confidence: low
 */
/* CAMPAIGN-PREP candidate for func_ov002_022368e8 (ov002, class D) — brief 494.
 * UNVERIFIED build-free draft. Byte-near-clone of 02236814: same two RMW
 * bitfield inserts into obj h4 (NET |=0xE, separate field writes / store-order),
 * same coord-unpack compare guard; ONLY the tail call differs.
 *   if(LHS==RHS){ 021d8904(); 021d63fc(o [r5=saved obj], h2&1, (h2>>1)&0x1f, 0); }
 *   return 0
 * 021d63fc 4th arg is literal 0 here (asm "mov r3,#0x0"); cf 02236814 where the
 * 4th came from h2. */
extern char data_ov002_022cf16c[];
extern void func_ov002_021d8904(void);
extern int  func_ov002_021d63fc(void *o, int a, int b, int c);

struct Obj8e8 {
    unsigned short h0;
    unsigned short b0 : 1;
    unsigned short s5 : 5;
    unsigned short : 10;
    unsigned short h4f1 : 2;
    unsigned short h4f2 : 1;
    unsigned short h4f3 : 1;
    unsigned short h4f6 : 9;
};
struct Rec8e8 { unsigned int : 13; unsigned int c13 : 1; unsigned int : 8; unsigned int c22 : 8; };

int func_ov002_022368e8(void *obj, struct Obj8e8 *o) {
    unsigned int W;
    int lhs, rhs;

    o->h4f2 = 1;
    o->h4f3 = 1;
    W = *(unsigned int *)((char *)data_ov002_022cf16c +
                          (o->b0 & 1) * 0x868 + o->s5 * 0x14 + 0x30);
    lhs = o->h4f6;
    rhs = (((struct Rec8e8 *)&W)->c22 << 1) + ((struct Rec8e8 *)&W)->c13;
    if (lhs == rhs) {
        func_ov002_021d8904();
        func_ov002_021d63fc(obj, o->b0 & 1, o->s5, 0);
    }
    return 0;
}
