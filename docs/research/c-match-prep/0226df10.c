/* CAMPAIGN-PREP candidate for func_0226df10 (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     CLASS D :15 bitfield (lsl#17;lsr#9) + :1 bit0; single i<=4 loop; arg0 bound, 0 held
 *   risk:       orig fuses the bit0+:15 header into a single load-modify-store; two bitfield assignments likely split into two RMW sequences. Secondary: const-0 3rd arg held in r5 vs re-mov'd per call. reshape-able-then-permuter (try one fused mask expr; reg residue -> permuter).
 *   confidence: low
 */
/* func_ov002_0226df10: bitfield-pack header into data_022cd300 (bit0=arg0;
 * :15 at bit8 = arg1 low15 via lsl#17;lsr#9) + set +0x16 bit1 + zero +8; then a
 * single counted loop i:0..4 calling sink(arg0,i,0). arg0 is bound (used in
 * header AND each call); const-0 3rd arg is loop-invariant in a saved reg.
 * reg-alloc-walled tier. */
#include "ov002_core.h"

extern int func_ov002_0227548c(int a, int b, int c);

struct Hdr300 { u32 b0 : 1; u32 _u1 : 7; u32 f8 : 15; u32 _u23 : 9; };
struct F30016 { u16 _b0 : 1; u16 b1 : 1; u16 _r : 14; };

int func_ov002_0226df10(int arg0, int arg1) {
    int i;
    ((struct Hdr300 *)data_ov002_022cd300)->b0 = arg0;
    ((struct Hdr300 *)data_ov002_022cd300)->f8 = arg1;
    ((struct F30016 *)(data_ov002_022cd300 + 0x16))->b1 = 1;
    data_ov002_022cd300[8] = 0;
    for (i = 0; i <= 4; i++)
        if (func_ov002_0227548c(arg0, i, 0)) return 1;
    return 0;
}
