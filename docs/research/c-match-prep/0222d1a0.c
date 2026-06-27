/* CAMPAIGN-PREP candidate for func_0222d1a0 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     h6hi as :8@8 bitfield (lsl16;lsr24); signed <0; flag0 reload
 *   risk:       the if/else over h0==0x16d5 differing only in the 3rd arg const (0 vs 1): mwcc may emit a single branch picking the const into a reg vs two full call sites; minor scheduling -> reshape-able (movne/moveq the const)
 *   confidence: med
 */
/* func_ov002_0222d1a0 (ov002, D) - bitfield guard, linear call chain.
 * r5=card. h6hi=(h6>>8)&0xff (:8@8 of h6@+6); if(h6hi != 1) return 0.
 * t = 0223def4(card, 0);
 * if((int)021b99b4(card->flag0, t) < 0) return 0;          (blt, signed)
 * if(card->h0 == 0x16d5) 021d7268(card->flag0, t, 0);
 * else                   021d7268(card->flag0, t, 1);
 * return 0. flag0 reloaded for 2nd use (orig re-ldrh h2). */
extern int func_ov002_0223def4(int a, int b);
extern int func_ov002_021b99b4(int a, int b);
extern int func_ov002_021d7268(int a, int b, int c);

typedef struct Obj {
    unsigned short h0;                       /* 0x00 */
    unsigned short flag0 : 1, : 15;          /* 0x02 */
    unsigned short u4;                        /* 0x04 */
    unsigned short : 8, h6hi : 8;             /* 0x06 */
} Obj;

int func_ov002_0222d1a0(Obj *card) {
    int t;
    if (card->h6hi != 1) return 0;
    t = func_ov002_0223def4((int)card, 0);
    if (func_ov002_021b99b4(card->flag0, t) < 0) return 0;
    if (card->h0 == 0x16d5) func_ov002_021d7268(card->flag0, t, 0);
    else func_ov002_021d7268(card->flag0, t, 1);
    return 0;
}
