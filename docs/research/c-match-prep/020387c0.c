/* CAMPAIGN-PREP candidate for func_020387c0 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     mul-index array base; zero 2 halfwords; counted loop-call setter
 *   risk:       two zero stores may both use [base] form instead of orig's [r1,r0]/[r2,#2] split; idx*0x84 mul should match
 *   confidence: med
 */
/* func_020387c0 - zero header (2 halfwords) of data_0219b550[idx], then init 16 sub-records */

typedef struct {
    short f0;
    short f2;
    short f4;
    short f6;
} S8;

typedef struct {
    short a;
    short b;
    S8   e[16];      /* 4 + 16*8 = 132 = 0x84 */
} Big;

extern Big data_0219b550[];
extern void func_020385d8(S8 *p, int v);

void func_020387c0(int idx)
{
    Big *S = &data_0219b550[idx];
    int i;

    S->a = 0;
    S->b = 0;
    for (i = 0; i < 16; i++)
        func_020385d8(&S->e[i], 0x7f);
}
