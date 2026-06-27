/* CAMPAIGN-PREP candidate for func_0222d5d8 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     f4 :9@6 bitfield; signed r<0; mla flag0*0x868; flag0 reload; 0x418 offset
 *   risk:       orig builds the pointer as base+0x18 then +0x400 (two adds) with flag0 folded into the mla; mwcc folds 0x418 in one add and may reorder mla vs the r*4 add -> reshape-able-ish, can slip permuter-class
 *   confidence: med
 */
/* func_ov002_0222d5d8 (ov002, D) - bitfield extract + mla (flag0)*stride base.
 * r4=card. r = 021b99b4(card->flag0, (h4>>6)&0x1ff);   f4=:9@6 of h4@+4
 * if((int)r < 0) return 0;                                  (bmi, signed)
 * 021d7d0c(card, card->flag0, (int)&cf16c[card->flag0*0x868 + 0x418 + r*4]);
 * return 0. flag0 reloaded for 2nd use (orig re-ldrh h2). 0x418 = 0x18+0x400. */
extern unsigned char data_ov002_022cf16c[];
extern int func_ov002_021b99b4(int a, int b);
extern int func_ov002_021d7d0c(int a, int b, int c);

typedef struct Obj {
    unsigned short h0;
    unsigned short flag0 : 1, : 15;     /* 0x02 */
    unsigned short : 6, f4 : 9, : 1;    /* 0x04 */
} Obj;

int func_ov002_0222d5d8(Obj *card) {
    int r = func_ov002_021b99b4(card->flag0, card->f4);
    if (r < 0) return 0;
    func_ov002_021d7d0c((int)card, card->flag0,
                        (int)&data_ov002_022cf16c[card->flag0 * 0x868 + 0x418 + r * 4]);
    return 0;
}
