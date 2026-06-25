/* CAMPAIGN-PREP candidate for func_0226d784 (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     clone of 0226d6f4: :15 bitfield pack + :1 bit0 + nested i<2/j<=4 loop, callee swapped
 *   risk:       same as 0226d6f4: orig fuses header into one RMW (two bitfield assigns may split into two), plus const-0 3rd arg held in callee-saved reg vs re-mov'd. permuter-class (shipped .s, reg-alloc wall).
 *   confidence: low
 */
/* func_ov002_0226d784: byte-identical structure to 0226d6f4, only the loop
 * sink differs (022705f8 -> 02270ba0). bitfield-pack header (bit0=arg0; :15 at
 * bit8=arg1) + set +0x16 bit1 + zero +8 + nested i:0..1 x j:0..4 sink(i,j,0).
 * reg-alloc-walled tier (currently ships as .s). */
#include "ov002_core.h"

extern int func_ov002_02270ba0(int a, int b, int c);

struct Hdr300 { u32 b0 : 1; u32 _u1 : 7; u32 f8 : 15; u32 _u23 : 9; };
struct F30016 { u16 _b0 : 1; u16 b1 : 1; u16 _r : 14; };

int func_ov002_0226d784(int arg0, int arg1) {
    int i, j;
    ((struct Hdr300 *)data_ov002_022cd300)->b0 = arg0;
    ((struct Hdr300 *)data_ov002_022cd300)->f8 = arg1;
    ((struct F30016 *)(data_ov002_022cd300 + 0x16))->b1 = 1;
    data_ov002_022cd300[8] = 0;
    for (i = 0; i < 2; i++)
        for (j = 0; j <= 4; j++)
            if (func_ov002_02270ba0(i, j, 0)) return 1;
    return 0;
}
