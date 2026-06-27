/* CAMPAIGN-PREP candidate for func_0222d9a8 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     phase order 0x7e/0x7f/0x80; ~t via mvn; variable-shift 1<<(flag0*16+k5)
 *   risk:       the ~t ^ (1<<shift) coord build: orig is mvn r,~0;eor;eor with shift = flag0*16+(h2>>1&0x1f); mwcc may reassociate or split the two eor / variable shift -> reshape-able-ish, shift expr could go permuter-class
 *   confidence: med
 */
/* func_ov002_0222d9a8 (ov002, D) - 3-way state switch, (x&1) select, coord eor.
 * r4=card. phase on ce288+0x5a8, tested 0x7e then 0x7f then 0x80.
 * 0x7e: t = 02257704(card); shift = card->flag0*16 + card->k5;
 *       021de408(card, ~t ^ (1 << shift)); return 0.
 * 0x7f: sel=1-flag0; if(*(int*)(cf178 + sel*0x868)==0) return 0x7e;
 *       021d7970(sel, 0, 1); return 0x7f.
 * 0x80: if(*(int*)(cf178 + flag0*0x868)==0) return 0x7f;
 *       021d7970(flag0, 0, 0); return 0x80. */
extern unsigned char data_ov002_022ce288[];
extern unsigned char data_ov002_022cf178[];
extern int func_ov002_021d7970(int a, int b, int c);
extern int func_ov002_021de408(int a, int b);
extern int func_ov002_02257704(int a);

typedef struct Obj {
    unsigned short h0;
    unsigned short flag0 : 1, k5 : 5, : 10;   /* 0x02 */
} Obj;

int func_ov002_0222d9a8(Obj *card) {
    int phase = *(int *)(data_ov002_022ce288 + 0x5a8);
    if (phase == 0x7e) {
        int t = func_ov002_02257704((int)card);
        int shift = card->flag0 * 16 + card->k5;
        func_ov002_021de408((int)card, ~t ^ (1 << shift));
        return 0;
    }
    if (phase == 0x7f) {
        int sel = 1 - card->flag0;
        if (*(int *)(data_ov002_022cf178 + sel * 0x868) == 0) return 0x7e;
        func_ov002_021d7970(sel, 0, 1);
        return 0x7f;
    }
    if (phase != 0x80) return 0;
    if (*(int *)(data_ov002_022cf178 + card->flag0 * 0x868) == 0) return 0x7f;
    func_ov002_021d7970(card->flag0, 0, 0);
    return 0x80;
}
