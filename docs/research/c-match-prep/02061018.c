/* CAMPAIGN-PREP candidate for func_02061018 (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     Class D: %D+0x21 twice, %32 via lsl27/ror27, reload _LIT3/iter, decl-order r9/r6.
 *   risk:       permuter-class: func_020b3870 returns an r0/r1 PAIR consumed across an interleaved mul; modelling it as a 2-int struct will almost certainly differ on reg rotation and the p0.b/p1.b extraction scheduling. Also ENC_MOD=29 is a guess.
 *   confidence: low
 */
/* func_02061018 — 32-byte encode/scramble generator (class D: divmod + loop).
 *   r5=out(arg0), r4=in(arg1). r8=tbl handle from func_020aaddc(_LIT0).
 *   fp=count from func_02061290(in). sl=i (0..31). r7=acc (+= _LIT3/iter).
 *   func_020b3870 returns TWO regs (r0,r1) -> modelled as a 2-int struct.
 *   "% D + 0x21" twice: asr#4 remainder family, D in 28..31 (exact from _LIT1 magic).
 *   inner index (i*r6 + table[..]) % 32 via lsl27/ror27.
 */
typedef signed char s8;
typedef unsigned char u8;

extern s8 data_021013f8;             /* _LIT3, per-iter increment for acc        */
extern s8 data_LIT0[];               /* _LIT0 table, passed to aaddc AND indexed  */

typedef struct { int a; int b; } Pair3870;

extern int      func_020aaddc(s8 *p);     /* returns table handle (-> r8)         */
extern int      func_02061290(int in);    /* returns count (-> fp)                */
extern int      func_020a991c(void);
extern int      func_020a6d48(int v);
extern Pair3870 func_020b3870(int idx, int tbl);

#define ENC_MOD 29   /* asr#4 family; CONFIRM against _LIT1 magic word (28..31)    */

int func_02061018(int out, int in)
{
    int tbl;
    int cnt;
    int acc;        /* r7 */
    int i;          /* sl */
    s8 *outp = (s8 *)out;
    s8 *inp  = (s8 *)in;

    tbl = func_020aaddc(data_LIT0);
    cnt = func_02061290(in);

    acc = 0;
    for (i = 0; i < 0x20; i++) {
        if (cnt == 0 || i == 0 || i == 0xd) {
            int v = func_020a991c();
            outp[i] = (s8)(v % ENC_MOD + 0x21);
        } else {
            int prev;       /* r9 */
            int c;          /* r6 */
            Pair3870 p0, p1;
            int t0, t1;
            int idx;
            int v;

            if (i == 1 || i == 0xe)
                prev = inp[i];
            else
                prev = inp[i - 1];

            c  = (u8)inp[i];
            p0 = func_020b3870(i + c, tbl);
            t0 = prev * acc;            /* mul uses old r9 before reload  */
            prev = p0.b;               /* mov r9,r1 (second return reg)  */
            p1 = func_020b3870(t0, tbl);

            t1 = data_LIT0[prev];      /* table[r9]  (r3)  */
            v  = data_LIT0[p1.b];      /* table[r1]  (r2)  */
            idx = (i * c + t1) % 0x20;
            v  = func_020a6d48(((u8)inp[idx]) ^ v);
            outp[i] = (s8)(v % ENC_MOD + 0x21);
        }
        acc += data_021013f8;
    }
    return out;
}
