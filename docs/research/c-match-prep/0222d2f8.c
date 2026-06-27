/* CAMPAIGN-PREP candidate for func_0222d2f8 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     phase dispatch; bind v=d0e6c+0xb2; card in r0 for the two helper calls
 *   risk:       the v==3 / v==0 chain shares the tail 021de408(card,t); mwcc may merge the two arms' common tail differently (one de408 site fed by a phi) -> branch-layout, reshape-able
 *   confidence: med
 */
/* func_ov002_0222d2f8 (ov002, D) - state switch, bitfield extracts, dispatch.
 * r4=card. phase on ce288+0x5a8.
 * 0x80: 0226b22c(card->flag0, card->k5, 3, 1); return 0x7f.
 * 0x7f: v = *(u16*)(d0e6c+0xb2);
 *       if(v == 3) 021de408(card, 02257704(card));
 *       else if(v == 0) 021de408(card, 02257750(card, func_021efac8));
 *       return 0. */
extern unsigned char data_ov002_022ce288[];
extern unsigned char data_ov002_022d0e6c[];
extern int func_ov002_021efac8(void);
extern int func_ov002_02257704(int a);
extern int func_ov002_02257750(int a, void *b);
extern int func_ov002_021de408(int a, int b);
extern int func_ov002_0226b22c(int a, int b, int c, int d);

typedef struct Obj {
    unsigned short h0;
    unsigned short flag0 : 1, k5 : 5, : 10;   /* 0x02 */
} Obj;

int func_ov002_0222d2f8(Obj *card) {
    int phase = *(int *)(data_ov002_022ce288 + 0x5a8);
    int v;
    if (phase == 0x7f) {
        v = *(unsigned short *)(data_ov002_022d0e6c + 0xb2);
        if (v == 3) {
            func_ov002_021de408((int)card, func_ov002_02257704((int)card));
        } else if (v == 0) {
            func_ov002_021de408((int)card, func_ov002_02257750((int)card, func_ov002_021efac8));
        }
        return 0;
    }
    if (phase != 0x80) return 0;
    func_ov002_0226b22c(card->flag0, card->k5, 3, 1);
    return 0x7f;
}
