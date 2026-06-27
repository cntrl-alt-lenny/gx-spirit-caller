/* CAMPAIGN-PREP candidate for func_02221e3c (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     prod=a*0x868 CSE; :1/:5 fields; deck-table packed compare; tail call 0222196c
 *   risk:       struct-guessed: identical two-symbol gate index [ce288 + (cf1a4+prod)] as 02221d4c; if the real struct makes this one ldr off a single base, mwcc emits one symbol not two — confirm the table layout.
 *   confidence: med
 */
/* func_ov002_02221e3c (ov002, D) — deck-table validate + secondary gate, then a
 * single tail call to 0222196c. Same descriptor math as 02221d4c/02220904.
 * r0=card. f2:1 bit0 (a), f2:5 bits1-5 (b). prod=a*0x868. w = cf16c + prod +
 * 0x30 + b*0x14. packed = ((w>>22)&0xff)<<1 + ((w>>13)&1) compared to f4 :9 at
 * bit6; ne->0. gate: u16 at [ce288, cf1a4+prod] !=0 else 0. Then tail 0222196c. */
typedef unsigned short u16;
struct Card { u16 f0; u16 f2; u16 f4; };
extern char data_ov002_022ce288[];
extern char data_ov002_022cf16c[];
extern char data_ov002_022cf1a4[];
extern int  func_ov002_0222196c(int a, struct Card *c);

int func_ov002_02221e3c(struct Card *c) {
    int a = c->f2 & 1;
    int b = (c->f2 << 0x1a) >> 0x1b;
    int prod = a * 0x868;
    int w = *(int *)(data_ov002_022cf16c + prod + 0x30 + b * 0x14);
    int packed = (((w >> 22) & 0xff) << 1) + ((w >> 13) & 1);
    if (((c->f4 << 0x11) >> 0x17) != packed)
        return 0;
    if (*(u16 *)(data_ov002_022ce288 + (int)(data_ov002_022cf1a4 + prod)) == 0)
        return 0;
    return func_ov002_0222196c(0, c);
}
