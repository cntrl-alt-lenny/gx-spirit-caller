/* CAMPAIGN-PREP candidate for func_02234090 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     stack out-coord byte-split (x&0xff,(u16)>>8); rec inline mla +0x30+y*0x14; r7 kept; 5-arg stack call
 *   risk:       0225764c missing extern decl + LIT2 value/r7-vs-tmp split inferred; r7 (callee-saved r7) live across many calls. struct-guessed + permuter-class (r7 liveness / stack-arg ordering).
 *   confidence: low
 */
/* CAMPAIGN-PREP candidate for func_ov002_02234090 (ov002, class D) - brief 494.
 * UNVERIFIED build-free draft. card@r6, one stack out-coord + one stack arg.
 * 0223df38(card, 0, &out); if 0 return 0. x=out&0xff, y=((u16)out>>8)&0xff.
 * 0225764c(card, x, y); if 0 return 0.
 * rec=*(int*)(&cf16c[(x&1)*0x868] + 0x30 + y*0x14).
 * v2=((rec>>22)&0xff)*2 ; r7=v2 + ((rec>>13)&1).
 * tmp=(u16)021bbf50(x, v2); store local; 021d59cc(x, y, key0, 2, tmp).
 * if 021b3ecc(x,0xb,LIT2): if 021b4120(x,0xb,LIT2)==r7 return0;
 *   else 021d5b80(x,0xb,key0,1); 021e276c(x,key0,1,0).
 * else 021e276c(x,key0,1,(u16)r7). return 0. */
typedef unsigned short u16;

extern char data_ov002_022cf16c[];
extern char data_ov002_022cf16c_lit2[];  /* LIT2 (real value in truncated pool) */
extern int  func_ov002_021b3ecc(int, int, void *);
extern int  func_ov002_021b4120(int, int, void *);
extern int  func_ov002_021bbf50(int, int);
extern int  func_ov002_021d59cc(int, int, int, int, int);
extern int  func_ov002_021d5b80(int, int, int, int);
extern int  func_ov002_021e276c(int, int, int, int);
extern int  func_ov002_0223df38(void *, int, int *);

int func_ov002_02234090(void *cardv) {
    u16 *base = (u16 *)cardv;
    int out;
    int x, y;
    int rec, v2, r7;
    int tmp;

    if (func_ov002_0223df38(cardv, 0, &out) == 0)
        return 0;
    x = out & 0xff;
    y = ((u16)out >> 8) & 0xff;
    if (func_ov002_0225764c(cardv, x, y) == 0)
        return 0;
    rec = *(int *)(data_ov002_022cf16c + (x & 1) * 0x868 + 0x30 + y * 0x14);
    v2 = ((rec >> 22) & 0xff) * 2;
    r7 = v2 + ((rec >> 13) & 1);
    tmp = (u16)func_ov002_021bbf50(x, v2);
    func_ov002_021d59cc(x, y, base[0], 2, tmp);
    if (func_ov002_021b3ecc(x, 0xb, data_ov002_022cf16c_lit2)) {
        if (func_ov002_021b4120(x, 0xb, data_ov002_022cf16c_lit2) == r7)
            return 0;
        func_ov002_021d5b80(x, 0xb, base[0], 1);
        func_ov002_021e276c(x, base[0], 1, 0);
    } else {
        func_ov002_021e276c(x, base[0], 1, (u16)r7);
    }
    return 0;
}
