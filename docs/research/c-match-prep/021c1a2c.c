/* CAMPAIGN-PREP candidate for func_021c1a2c (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     idx & row locals shared across reads; 13-bit :bitfield via lsl/lsr (movs sets Z); rsb 1-arg0
 *   risk:       id read uses lsl#0x13;movs lsr#0x13 (sets flags directly, no extra cmp) — the :13 bitfield ==0 reproduces this. orig holds ip=(arg0&1)*0x868 and r3=arg1*20 across both reads; recompute would add mul. reshape-able via shared idx/row. 021c1954 arg count guessed (0).
 *   confidence: med
 */
/* func_ov002_021c1a2c: validate slot[arg0&1][arg1] — its +0x30 13-bit id must
 * be set, its +0x38 u16 must be set; then 021c1954() must be clear, 021b8fcc
 * must hold, and 021bd030(1-arg0) must be >=0. Returns 0 on any veto else 1. */

struct slot { unsigned int id : 13; unsigned int _hi : 19; };

extern char            data_ov002_022cf16c[];
extern unsigned short  data_ov002_022cf1a4[];
extern int  func_ov002_021b8fcc(int a, int b);
extern int  func_ov002_021bd030(int a);
extern int  func_ov002_021c1954(void);

int func_ov002_021c1a2c(int arg0, int arg1) {
    int idx = (arg0 & 1) * 0x868;
    int row = arg1 * 20;
    if (((struct slot *)((char *)data_ov002_022cf16c + idx + row + 0x30))->id == 0)
        return 0;
    if (*(unsigned short *)((char *)data_ov002_022cf1a4 + row + idx) == 0)
        return 1;
    if (func_ov002_021c1954() != 0)
        return 0;
    if (func_ov002_021b8fcc(arg0, arg1) == 0)
        return 1;
    if (func_ov002_021bd030(1 - arg0) < 0)
        return 0;
    return 1;
}
