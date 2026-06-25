/* CAMPAIGN-PREP candidate for func_0226d6f4 (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     CLASS D :15 bitfield for lsl#17;lsr#9 pack + :1 bit0; nested i<2/j<=4 loop; literal-0 3rd arg
 *   risk:       orig fuses the bit0+:15 header into ONE load-modify-store (bic;orr;and;orr;str); two separate bitfield assigns likely emit two RMW cycles, and orig hoists the const-0 3rd arg into a callee-saved reg (mov r2 each call vs held). permuter-class (already shipped .s, reg-alloc wall).
 *   confidence: low
 */
/* func_ov002_0226d6f4: bitfield-pack header into data_022cd300 (bit0=arg0;
 * :15 field at bit8 = arg1 low15 via lsl#17;lsr#9), set +0x16 bit1, zero +8;
 * then nested loop i:0..1 x j:0..4 calling sink(i,j,0). Third arg 0 is held in
 * a callee-saved reg by the orig (loop-invariant). reg-alloc-walled tier
 * (currently ships as .s). */
#include "ov002_core.h"

extern int func_ov002_022705f8(int a, int b, int c);

/* 32-bit word @ data_022cd300: bit0, bits1-7 preserved, :15 at bit8, top9 preserved */
struct Hdr300 { u32 b0 : 1; u32 _u1 : 7; u32 f8 : 15; u32 _u23 : 9; };
struct F30016 { u16 _b0 : 1; u16 b1 : 1; u16 _r : 14; };

int func_ov002_0226d6f4(int arg0, int arg1) {
    int i, j;
    ((struct Hdr300 *)data_ov002_022cd300)->b0 = arg0;
    ((struct Hdr300 *)data_ov002_022cd300)->f8 = arg1;
    ((struct F30016 *)(data_ov002_022cd300 + 0x16))->b1 = 1;
    data_ov002_022cd300[8] = 0;
    for (i = 0; i < 2; i++)
        for (j = 0; j <= 4; j++)
            if (func_ov002_022705f8(i, j, 0)) return 1;
    return 0;
}
