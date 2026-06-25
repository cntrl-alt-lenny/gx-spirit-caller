/* CAMPAIGN-PREP candidate for func_021cab30 (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     flag/idx first; mla row reused as loop base; :8/:1 bitfields for S[10]; store order 2,0,1,7,8,10,9
 *   risk:       struct-guessed + reshape-able: the cd3f4 store ORDER (0x8,0x0,0x4,0x1c,0x20,0x28,0x24, NOT ascending) is the top divergence — mwcc may sort stores; if so reorder/volatile. row(r6) reuse as both w-base and loop induction is scheduling-sensitive.
 *   confidence: low
 */
/* func_ov002_021cab30: void init. flag = (u16[ce950]&0x8000)!=0; idx =
 * u16[ce950+2]. If ce950[0x810]==0: read w from row cf16c+(flag)*0x868 at
 * +0x30+idx*0x14, populate the scratch struct cd3f4 (note store ORDER), zero
 * row+i*0x14+0x3c for i in 0..4 (skip i==idx) when func_021b9ecc(flag,i)
 * ==0x1a79, fire three calls, bump ce950[0x810]. Then if func_0229c7f8(0xb)
 * ==0 clear ce950[0x80c]. */
extern char data_ov002_022cd3f4[];
extern char data_ov002_022ce950[];
extern char data_ov002_022cf16c[];
extern int  func_ov002_021b9ecc(int a, int b);
extern void func_ov002_021c9b2c(int a, int b, int c);
extern void func_ov002_021c9af0(int a, int b);
extern void func_ov002_0229ade0(int a, int b, int c, int d);
extern int  func_ov002_0229c7f8(int a);

struct Ov002Wbits {
    unsigned int : 13;
    unsigned int b13 : 1;
    unsigned int : 8;
    unsigned int f8 : 8;
    unsigned int : 2;
};

void func_ov002_021cab30(void) {
    int flag = (*(unsigned short *)data_ov002_022ce950 & 0x8000) != 0;
    int idx = *(unsigned short *)(data_ov002_022ce950 + 0x2);
    if (*(int *)(data_ov002_022ce950 + 0x810) == 0) {
        char *row = data_ov002_022cf16c + (flag & 1) * 0x868;
        struct Ov002Wbits *wp =
            (struct Ov002Wbits *)(row + 0x30 + idx * 0x14);
        int nflag = 1 - flag;
        int *S = (int *)data_ov002_022cd3f4;
        int i;
        S[2] = 1;
        S[0] = flag;
        S[1] = nflag;
        S[7] = idx;
        S[8] = 5;
        S[10] = (wp->f8 << 1) + wp->b13;
        S[9] = 0;
        for (i = 0; i <= 4; i++) {
            if (i != idx)
                if (func_ov002_021b9ecc(flag, i) == 0x1a79)
                    *(int *)(row + i * 0x14 + 0x3c) = 0;
        }
        func_ov002_021c9b2c(flag, 0x12, 1);
        func_ov002_021c9af0(1, 1);
        func_ov002_0229ade0(0xb, idx, nflag, 5);
        *(int *)(data_ov002_022ce950 + 0x810) += 1;
    }
    if (func_ov002_0229c7f8(0xb) == 0)
        *(int *)(data_ov002_022ce950 + 0x80c) = 0;
}
