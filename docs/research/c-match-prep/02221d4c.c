/* CAMPAIGN-PREP candidate for func_02221d4c (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     prod=a*0x868 reused (orig CSEs it); :1/:5; deck-table; state gate; tail call
 *   risk:       struct-guessed: the cf1a4 gate is addressed as [r3=ce288, r2=cf1a4+prod] (two-symbol index); the exact base/offset pairing is inferred — confirm which symbol is base vs offset.
 *   confidence: med
 */
/* func_ov002_02221d4c (ov002, D) — deck-table validate, secondary-table gate,
 * state-conditional helper, tail call. r5=arg0(card), r4=arg1. f2:1 bit0 (a),
 * f2:5 bits1-5 (b). prod = a*0x868. rec = cf16c + prod + 0x30 + b*0x14 -> w.
 * packed = ((w>>22)&0xff)<<1 + ((w>>13)&1); cmp to f4 :9 at bit6; ne->return 0.
 * gate: u16 at cf1a4 + prod (+arg0-base r3=data_022ce288) must be !=0. If state
 * @+0x5a8==0x80: if b3ecc(11,0x14c4)!=0 return 0; else e276c(bit0,0x14c4,1,0).
 * tail: 022112f8(card, arg1). */
typedef unsigned short u16;
struct Card { u16 f0; u16 f2; u16 f4; };
extern char data_ov002_022ce288[];
extern char data_ov002_022cf16c[];
extern char data_ov002_022cf1a4[];
extern int  func_ov002_021b3ecc(int a, int b);
extern void func_ov002_021e276c(int a, int b, int c, int d);
extern int  func_ov002_022112f8(struct Card *c, int arg1);

int func_ov002_02221d4c(struct Card *c, int arg1) {
    int a = c->f2 & 1;
    int b = (c->f2 << 0x1a) >> 0x1b;
    int prod = a * 0x868;
    int w = *(int *)(data_ov002_022cf16c + prod + 0x30 + b * 0x14);
    int packed = (((w >> 22) & 0xff) << 1) + ((w >> 13) & 1);
    if (((c->f4 << 0x11) >> 0x17) != packed)
        return 0;
    if (*(u16 *)(data_ov002_022ce288 + (int)(data_ov002_022cf1a4 + prod)) == 0)
        return 0;
    if (*(int *)(data_ov002_022ce288 + 0x5a8) == 0x80) {
        if (func_ov002_021b3ecc(0xb, 0x14c4) != 0)
            return 0;
        func_ov002_021e276c(c->f2 & 1, 0x14c4, 1, 0);
    }
    return func_ov002_022112f8(c, arg1);
}
