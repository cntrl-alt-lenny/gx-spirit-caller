/* CAMPAIGN-PREP candidate for func_02249cec (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     class D: low13 bound to one local reused x3 calls; 0x5dc=0x868-0x28c bound; base+0x418
 *   risk:       reshape-able: orig holds low13 in callee-saved sl across 3 calls; binding it to one local (done) should match — if mwcc recomputes the shift per use, hoist explicitly. 0x5dc may load as fresh literal.
 *   confidence: med
 */
/* CAMPAIGN-PREP candidate for func_ov002_02249cec (ov002, class D) — MED tier.
 * ANALYSIS-ONLY. po=(arg0&1)*0x868; guard cf180 (=cf16c+0x14) nonzero; base=cf16c+po;
 * records base+0x18+0x400 stride 4; count [base+0x14]. low13=((u32)w<<19)>>19 held
 * (sl) and reused across three helper calls: func_0202e234(low13)!=0,
 * func_0202b950(low13) <= 0x5dc (=0x868-0x28c, derived from live 0x868 reg),
 * func_0202e270(low13)==0, then func_ov002_02253458(arg0,0xe,i). No packed arg. */
typedef unsigned int u32;

extern int  data_ov002_022cf180[];               /* = cf16c+0x14 (count) */
extern char data_ov002_022cf16c[];
extern int  func_0202e234(int low13);
extern int  func_0202b950(int low13);
extern int  func_0202e270(int low13);
extern void func_ov002_02253458(int arg0, int kind, int idx);

void func_ov002_02249cec(int arg0) {
    char *base;
    u32 *rec;
    int i, n, low13;
    int po = (arg0 & 1) * 0x868;

    if (*(int *)((char *)data_ov002_022cf180 + po) == 0)
        return;
    base = data_ov002_022cf16c + po;
    rec = (u32 *)(base + 0x18 + 0x400);
    i = 0;
    do {
        low13 = (int)(((u32)*rec << 19) >> 19);
        if (func_0202e234(low13) != 0 &&
            func_0202b950(low13) <= 0x868 - 0x28c &&
            func_0202e270(low13) == 0)
            func_ov002_02253458(arg0, 0xe, i);
        n = *(int *)(base + 0x14);
        i++;
        rec++;
    } while ((u32)i < (u32)n);
}
