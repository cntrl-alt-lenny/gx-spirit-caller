/* CAMPAIGN-PREP candidate for func_0222d644 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     s12 :2@12 + f2 :1@2 bitfields; signed >=2; flag0/h0/k5 arg order
 *   risk:       orig holds h2 in r2 across the s12 test and the (h4>>2) guard then re-derives flag0/k5 from it; mwcc reloads h2 per bitfield access (separate ldrh) -> extra ldrh divergence, reshape-able by binding h2 to one local
 *   confidence: med
 */
/* func_ov002_0222d644 (ov002, D) - bitfield guards, guarded return chain.
 * r4=card. r2 holds h2 across the early guards.
 * s2=(h2>>12)&3 (:2@12); if(s2 == 2) return 02210104(card);   (tail, returns callee)
 * if((h4>>2)&1) return 0;                                        (:1@2 of h4)
 * if((int)021bb7f8(card->flag0, h0, k5) >= 2) {                   (blt<2 skips)
 *     021e104c(card->flag0, 3);
 *     021de408(card, 02257704(card));
 * }
 * return 0. */
extern int func_ov002_021bb7f8(int a, int b, int c);
extern int func_ov002_021de408(int a, int b);
extern int func_ov002_021e104c(int a, int b);
extern int func_ov002_02210104(int a);
extern int func_ov002_02257704(int a);

typedef struct Obj {
    unsigned short h0;                               /* 0x00 */
    unsigned short flag0 : 1, k5 : 5, : 6, s12 : 2, : 2; /* 0x02 */
    unsigned short : 2, f2 : 1, : 13;               /* 0x04 */
} Obj;

int func_ov002_0222d644(Obj *card) {
    if (card->s12 == 2) return func_ov002_02210104((int)card);
    if (card->f2) return 0;
    if (func_ov002_021bb7f8(card->flag0, card->h0, card->k5) >= 2) {
        func_ov002_021e104c(card->flag0, 3);
        func_ov002_021de408((int)card, func_ov002_02257704((int)card));
    }
    return 0;
}
