/* CAMPAIGN-PREP candidate for func_022494a4 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     class D: low13 held local, bound 0x5dc=0x868-0x28c, reload+pack b8*2+bit13 literal shifts
 *   risk:       reshape-able: the 0x5dc bound is materialized as sub r4,r0,#0x28c off the live 0x868 reg; if mwcc loads a fresh 0x5dc literal, write it as (0x868-0x28c) (done) or bind po-product reg.
 *   confidence: med
 */
/* CAMPAIGN-PREP candidate for func_ov002_022494a4 (ov002, class D) — MED tier.
 * ANALYSIS-ONLY. ov002 per-parity loop; po=(arg0&1)*0x868; guard cf17c nonzero;
 * base=cf16c+po; records at base+0x260 stride 4; count re-read [base+0x10].
 * Guard chain on low13=((u32)w<<19)>>19 (held r7): func_0202e234(low13) nonzero,
 * func_0202b950(low13) <= 0x5dc (=0x868-0x28c, a bound derived from the 0x868 lit),
 * func_021ca440(arg0,low13) nonzero, then RELOAD w and pack r3=b8*2+bit13
 * (b8=(w<<2)>>24, bit13=(w<<18)>>31) for func_021b3fd8(arg0,0xb,0x12a1,packed)==0,
 * then func_ov002_02253458(arg0,0xd,i). */
typedef unsigned int u32;

extern int  data_ov002_022cf17c[];               /* = cf16c+0x10 (count) */
extern char data_ov002_022cf16c[];
extern int  func_0202e234(int low13);
extern int  func_0202b950(int low13);
extern int  func_ov002_021ca440(int arg0, int low13);
extern int  func_ov002_021b3fd8(int arg0, int a, int b, int packed);
extern void func_ov002_02253458(int arg0, int kind, int idx);

void func_ov002_022494a4(int arg0) {
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
            func_0202b950(low13) <= 0x868 - 0x28c &&
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
