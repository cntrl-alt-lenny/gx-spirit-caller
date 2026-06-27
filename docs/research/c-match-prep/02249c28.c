/* CAMPAIGN-PREP candidate for func_02249c28 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     class D: arg2 param kept, count via cf180=+0x14, base+0x418 records, packed != arg2
 *   risk:       reshape-able: arg2 must survive in a callee-saved reg across the calls (orig holds r7); if mwcc spills it, add an early local copy. Packed-shift order may rotate (lift to temp).
 *   confidence: med
 */
/* CAMPAIGN-PREP candidate for func_ov002_02249c28 (ov002, class D) — MED tier.
 * ANALYSIS-ONLY. Takes arg0 and arg2 (held r7); arg1 in slot unused for math.
 * po=(arg0&1)*0x868; guard via cf180 symbol (=cf16c+0x14) nonzero; base=cf16c+po;
 * records at base+0x18+0x400 (=base+0x418) stride 4; count re-read [base+0x14].
 * low13=((u32)w<<19)>>19: func_0202e234(low13)!=0, func_021c33e4(arg0,arg0,i)!=0,
 * then RELOAD w, packed = b8*2 + bit13 (b8=(w<<2)>>24, bit13=(w<<18)>>31) compared
 * != arg2, then func_ov002_02253458(arg0,0xe,i). */
typedef unsigned int u32;

extern int  data_ov002_022cf180[];               /* = cf16c+0x14 (count) */
extern char data_ov002_022cf16c[];
extern int  func_0202e234(int low13);
extern int  func_ov002_021c33e4(int a, int b, int idx);
extern void func_ov002_02253458(int arg0, int kind, int idx);

void func_ov002_02249c28(int arg0, int arg1, int arg2) {
    char *base;
    u32 *rec;
    int i, n;
    u32 w;
    int po = (arg0 & 1) * 0x868;

    if (*(int *)((char *)data_ov002_022cf180 + po) == 0)
        return;
    base = data_ov002_022cf16c + po;
    rec = (u32 *)(base + 0x18 + 0x400);
    i = 0;
    do {
        if (func_0202e234((int)(((u32)*rec << 19) >> 19)) != 0 &&
            func_ov002_021c33e4(arg0, arg0, i) != 0) {
            w = *rec;
            if ((int)(((w << 2) >> 24) * 2 + ((w << 18) >> 31)) != arg2)
                func_ov002_02253458(arg0, 0xe, i);
        }
        n = *(int *)(base + 0x14);
        i++;
        rec++;
    } while ((u32)i < (u32)n);
}
