/* CAMPAIGN-PREP candidate for func_02249d9c (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     class D: low13 held, guard chain, reload+pack b8*2+bit13 literal shifts; base+0x260
 *   risk:       reshape-able: clone of 022494a4 with b8a8/<=3 instead of b950/<=0x5dc; risk is the reload-vs-CSE of w for the packed arg and packed-shift reg rotation — lift packed to a temp if it diverges.
 *   confidence: med
 */
/* CAMPAIGN-PREP candidate for func_ov002_02249d9c (ov002, class D) — MED tier.
 * ANALYSIS-ONLY. po=(arg0&1)*0x868; guard cf17c (=cf16c+0x10) nonzero; base=cf16c+po;
 * records base+0x260 stride 4; count [base+0x10]. low13=((u32)w<<19)>>19 (r7):
 * func_0202e234(low13)!=0, func_0202b8a8(low13) <= 3, func_021ca440(arg0,low13)!=0,
 * then RELOAD w and pack r3=b8*2+bit13 (b8=(w<<2)>>24, bit13=(w<<18)>>31) for
 * func_021b3fd8(arg0,0xb,0x12a1,packed)==0, then func_ov002_02253458(arg0,0xd,i). */
typedef unsigned int u32;

extern int  data_ov002_022cf17c[];               /* = cf16c+0x10 (count) */
extern char data_ov002_022cf16c[];
extern int  func_0202e234(int low13);
extern int  func_0202b8a8(int low13);
extern int  func_ov002_021ca440(int arg0, int low13);
extern int  func_ov002_021b3fd8(int arg0, int a, int b, int packed);
extern void func_ov002_02253458(int arg0, int kind, int idx);

void func_ov002_02249d9c(int arg0) {
    char *base;
    u32 *rec;
    int i, n, low13;
    u32 w;
    int po = (arg0 & 1) * 0x868;

    if (*(int *)((char *)data_ov002_022cf17c + po) == 0)
        return;
    base = data_ov002_022cf16c + po;
    rec = (u32 *)(base + 0x260);
    i = 0;
    do {
        low13 = (int)(((u32)*rec << 19) >> 19);
        if (func_0202e234(low13) != 0 &&
            func_0202b8a8(low13) <= 3 &&
            func_ov002_021ca440(arg0, low13) != 0) {
            w = *rec;
            if (func_ov002_021b3fd8(arg0, 0xb, 0x12a1,
                    (int)(((w << 2) >> 24) * 2 + ((w << 18) >> 31))) == 0)
                func_ov002_02253458(arg0, 0xd, i);
        }
        n = *(int *)(base + 0x10);
        i++;
        rec++;
    } while ((u32)i < (u32)n);
}
