/* CAMPAIGN-PREP candidate for func_0224a3d0 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     D: sparse switch value-remap + mla base + :13 id; C: base bound once, early :13 load
 *   risk:       Sparse switch: orig is a hand-balanced cmp-tree pivoting 0x16fd then 0x15d4; mwcc -O4 builds its OWN binary search order -> pivot/branch mismatch. permuter-class. Also _LIT8 const + default-path (the early dummy id load) struct-guessed.
 *   confidence: low
 */
/* func_ov002_0224a3d0: remap arg1 through a sparse value table (cmp-tree),
 * read a :13 id from per-player word [base+0x120+arg2*4] (UNUSED in the
 * remap but loaded early), then 0202df78(remap) / 021ca3f0(self,remap) /
 * 02253458(self,0xb,arg2). cls D: sparse switch-remap + mla base + :13.
 * NOTE _LIT8 (the arg1==0x1821 result) is truncated from the asm dump:
 * the `0x1821` case constant is GUESSED below. */

typedef unsigned int u32;

struct W0224a3d0 { u32 id : 13; u32 : 19; };

extern char data_ov002_022cf16c[];

extern int  func_0202df78(int id, int remap);
extern int  func_ov002_021ca3f0(int self, int remap);
extern int  func_ov002_02253458(int a, int b, int c);

int func_ov002_0224a3d0(int arg0, int arg1, int arg2) {
    char *base;
    int remap;
    int dummy;
    base = data_ov002_022cf16c + (arg0 & 1) * 0x868;
    dummy = ((struct W0224a3d0 *)(base + 0x120 + arg2 * 4))->id;
    (void)dummy;
    switch (arg1) {
    case 0x16fd: remap = arg1;            break;  /* .L_c0 */
    case 0x15d4: remap = 0x15d4 + 1;      break;  /* 0x15d5 */
    case 0x15d0: remap = 0x15d4 - 3;      break;  /* .L_b8 -> 0x15d1 */
    case 0x1476: remap = 0x1121;          break;  /* _LIT4 -> _LIT5 */
    case 0x165b: remap = 0x15d4 + 0x71;   break;  /* 0x1645 */
    case 0x17dd: remap = 0x15d4 + 0x790;  break;  /* 0x1d64 */
    case 0x189a: remap = 0xfa7;           break;  /* _LIT6 -> _LIT7 */
    case 0x1821: remap = 0x1821;          break;  /* _LIT8 GUESSED */
    default:     return 1;
    }
    if (func_0202df78(arg1, remap) == 0)
        return 1;
    if (func_ov002_021ca3f0(arg0, remap) == 0)
        return 1;
    func_ov002_02253458(arg0, 0xb, arg2);
    return 1;
}
