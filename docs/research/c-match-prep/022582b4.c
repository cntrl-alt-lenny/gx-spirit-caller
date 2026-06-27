/* CAMPAIGN-PREP candidate for func_022582b4 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     store-order kept; pack via &0xffff/<<31&0x80000000; reload pool per-block
 *   risk:       permuter-class: orig holds pool base in r2 across early uses then reloads _LIT0 per branch; mwcc may bind base to a local register, diverging the ldr scheduling. arg!=0 branch passes arg in r2.
 *   confidence: med
 */
/* func_ov002_022582b4: class D. Compare pool field at 0xd5c to 0xfee;
 * if equal, tail-call 022583b4(1,0,0). Else set flag, call 02254a2c,
 * then branch on the arg: pack pool fields into r0/r1 and call
 * 021e3354 (arg!=0) or 021e311c (arg==0), finally clear 0xd50.
 * Packing idiom confirmed by matched sibling func_ov002_022598ec.c:
 *   r0 = ((d70 & 1)<<31) | 0x4e0000 | (d5c & 0xffff)
 *   r1 = (d60 & 0xffff)
 */
struct Pool022582b4 {
    char pad_d50[0xd50];
    int  f_d50;        /* 0xd50 */
    char pad_d54[0x8];
    int  f_d5c;        /* 0xd5c */
    int  f_d60;        /* 0xd60 */
    char pad_d64[0xc];
    int  f_d70;        /* 0xd70 */
};
extern struct Pool022582b4 data_ov002_022d016c;
extern int data_ov002_022ce288;   /* +0x5d8 written = 1 */
extern int func_ov002_021e311c(unsigned int r0, unsigned int r1, int r2, int r3);
extern int func_ov002_021e3354(unsigned int r0, unsigned int r1, int r2, int r3);
extern int func_ov002_02254a2c(int x);
extern void func_ov002_022583b4(int a, int b, int c);

void func_ov002_022582b4(int arg)
{
    if (data_ov002_022d016c.f_d5c == 0xfee) {
        func_ov002_022583b4(1, 0, 0);
        return;
    }
    (&data_ov002_022ce288)[0x5d8 / 4] = 1;
    func_ov002_02254a2c(data_ov002_022d016c.f_d70);
    if (arg != 0) {
        unsigned int r0 = (((unsigned int)data_ov002_022d016c.f_d70 << 31) & 0x80000000u)
                          | 0x4e0000u | (data_ov002_022d016c.f_d5c & 0xffffu);
        unsigned int r1 = data_ov002_022d016c.f_d60 & 0xffffu;
        func_ov002_021e3354(r0, r1, arg, 0);
    } else {
        unsigned int r0 = (((unsigned int)data_ov002_022d016c.f_d70 << 31) & 0x80000000u)
                          | 0x4e0000u | (data_ov002_022d016c.f_d5c & 0xffffu);
        unsigned int r1 = data_ov002_022d016c.f_d60 & 0xffffu;
        func_ov002_021e311c(r0, r1, 0, 0);
    }
    data_ov002_022d016c.f_d50 = 0;
}
