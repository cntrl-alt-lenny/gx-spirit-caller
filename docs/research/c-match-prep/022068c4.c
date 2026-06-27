/* CAMPAIGN-PREP candidate for func_022068c4 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     all guard shifts verified exact (:6@6,:1@9,:1@14,:4@19,:9@0 fused *4=>lsr#21); v&0x1fff non-immediate => lsl#19;lsr#19.
 *   risk:       reshape-able (operand-order): 'w14.b9 == f2.b0' is the one coin-flip — asm materializes b9 and folds b0 in the cmp shifter; swap operands if it diverges. Offsets struct-guessed.
 *   confidence: med
 */
/* CAMPAIGN-PREP candidate for func_ov002_022068c4 (ov002, class D) — brief 494.
 * UNVERIFIED build-free draft. Leaf bitfield guard-chain on field@+2 and word@+0x14.
 * Guards (all return 0 on fail): f2.:6@bit6 == 0x16; w14.bit9 == f2.bit0;
 *   w14.bit14 != 0; w14.:4@bit19 == 0xe. Then idx = w14.:9@bit0;
 *   v = *(u16*)(d0250 + idx*4); return 0202e234(v & 0x1fff) != 0.
 * 0x1fff is NOT an ARM immediate -> the mask emits lsl#19;lsr#19 as in asm. */
typedef unsigned short u16;

extern char data_ov002_022d0250[];   /* stride-4 record table, u16 head */
extern int  func_0202e234(int a);

struct Fld68c4  { u16 b0 : 1; u16 _1 : 5; u16 f6 : 6; u16 _12 : 4; };
struct Wrd68c4  { unsigned i9 : 9; unsigned b9 : 1; unsigned _10 : 4;
                  unsigned b14 : 1; unsigned _15 : 4; unsigned f19 : 4;
                  unsigned _23 : 9; };
struct Ent68c4  { u16 _0; struct Fld68c4 f2; char _4[16]; struct Wrd68c4 w14; };

int func_ov002_022068c4(struct Ent68c4 *p) {
    int v;
    if (p->f2.f6 != 0x16)
        return 0;
    if (p->w14.b9 == p->f2.b0)
        return 0;
    if (p->w14.b14 == 0)
        return 0;
    if (p->w14.f19 != 0xe)
        return 0;
    v = *(u16 *)(data_ov002_022d0250 + p->w14.i9 * 4);
    return func_0202e234(v & 0x1fff) != 0;
}
