/* CAMPAIGN-PREP candidate for func_0222cee4 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     emit fb1/fb2/fb3 stores in asm order; :N bitfields; unsigned k5 compare
 *   risk:       store coalescing: orig folds fb1+fb2 into one strh then reloads for fb3; mwcc likely emits 3 separate strh (or a different split) -> store-order divergence, reshape-able by tuning the bitfield grouping
 *   confidence: low
 */
/* func_ov002_0222cee4 (ov002, D) - bitfield-insert RMW field writes then call.
 * r0=card, r1=obj.  phase dispatch on ce288+0x5a8.
 * 0x80: obj->h4 fb1@1=1; fb2@2=fb1 (combined one strh); reload, fb3@3=fb2 (strh);
 *       021d8904(obj->flag0, obj->k5, (h4>>6)&0x1ff);
 *       if((obj->h2>>1 & 0x1f) > 0xa) return 0;            (bhi, unsigned)
 *       if(!021de598(card, obj->flag0)) return 0; return 0x7f.
 * 0x7f: 021e104c(card->flag0, 1); return 0. */
extern unsigned char data_ov002_022ce288[];
extern int func_ov002_021d8904(int a, int b, int c);
extern int func_ov002_021de598(int a, int b);
extern int func_ov002_021e104c(int a, int b);

typedef struct Obj {
    unsigned short h0;                              /* 0x00 */
    unsigned short flag0 : 1, k5 : 5, : 10;         /* 0x02 */
    unsigned short : 1, fb1 : 1, fb2 : 1, fb3 : 1, : 2, f4h4 : 9, : 1; /* 0x04 */
} Obj;

int func_ov002_0222cee4(Obj *card, Obj *obj) {
    int phase = *(int *)(data_ov002_022ce288 + 0x5a8);
    if (phase == 0x7f) {
        func_ov002_021e104c(card->flag0, 1);
        return 0;
    }
    if (phase != 0x80) return 0;
    obj->fb1 = 1;
    obj->fb2 = obj->fb1;
    obj->fb3 = obj->fb2;
    func_ov002_021d8904(obj->flag0, obj->k5, obj->f4h4);
    if ((unsigned)obj->k5 > 0xa) return 0;
    if (!func_ov002_021de598((int)card, obj->flag0)) return 0;
    return 0x7f;
}
