/* CAMPAIGN-PREP candidate for func_02249ec4 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     class D: two single-bit tests as (w<<k)>>31 to force movs lsr#0x1f, not tst/and
 *   risk:       reshape-able: mwcc may fold the two bit tests to tst #(1<<17)/tst #(1<<20) instead of the shift+movs pair; if so keep the shift form (done) or split into separate if-statements to serialize the two movs.
 *   confidence: med
 */
/* CAMPAIGN-PREP candidate for func_ov002_02249ec4 (ov002, class D) — MED tier.
 * ANALYSIS-ONLY. po=(arg0&1)*0x868; guard cf180 (=cf16c+0x14) nonzero; base=cf16c+po;
 * records base+0x18+0x400 stride 4; count [base+0x14]. func_0202e234(low13)!=0 (low13
 * =((u32)w<<19)>>19); then RELOAD w for two single-bit tests done as movs lsr#0x1f:
 * bit17=(w<<0xe)>>31 must be SET (beq skip), bit20=(w<<0xb)>>31 must be CLEAR
 * (bne skip); written as literal shifts to force lsl#0xe;lsr#0x1f / lsl#0xb;lsr#0x1f
 * (a plain &mask would emit tst/and). Then func_ov002_02253458(arg0,0xe,i). */
typedef unsigned int u32;

extern int  data_ov002_022cf180[];               /* = cf16c+0x14 (count) */
extern char data_ov002_022cf16c[];
extern int  func_0202e234(int low13);
extern void func_ov002_02253458(int arg0, int kind, int idx);

void func_ov002_02249ec4(int arg0) {
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
        if (func_0202e234((int)(((u32)*rec << 19) >> 19)) != 0) {
            w = *rec;
            if (((w << 0xe) >> 31) != 0 && ((w << 0xb) >> 31) == 0)
                func_ov002_02253458(arg0, 0xe, i);
        }
        n = *(int *)(base + 0x14);
        i++;
        rec++;
    } while ((u32)i < (u32)n);
}
