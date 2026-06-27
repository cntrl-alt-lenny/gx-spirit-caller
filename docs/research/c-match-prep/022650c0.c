/* CAMPAIGN-PREP candidate for func_022650c0 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     CLASS D: signed /5 via plain `/` (smull magic+asr); per-player index (arg0&1)*0x868 +0 field
 *   risk:       reshape-able: divisor is /5 (0x66666667,asr#2) not /4 per note. Struct-guessed: cf16c row field at +0; if real offset differs the ldr base is wrong.
 *   confidence: med
 */
/* func_ov002_022650c0: guard then signed-divide-by-5 arg into a sink.
 * If func_021b4098(arg0,0xb,0x143d): call func_021df6d4(arg0,0x143d); then
 * field = *(int*)(cf16c + (arg0&1)*0x868)  [+0 of the per-player row];
 * func_021df73c(arg0, (field+5)/5)  [smull 0x66666667 + asr#2 => signed /5].
 * Always return 1. mul (not mla) for (arg0&1)*0x868 -> keep the index expr. */
#include "ov002_core.h"

extern int func_ov002_021b4098(int a, int b, int c);
extern int func_ov002_021df6d4(int a, int b);
extern int func_ov002_021df73c(int a, int b);

int func_ov002_022650c0(int arg0) {
    int field;

    if (func_ov002_021b4098(arg0, 0xb, 0x143d) != 0) {
        func_ov002_021df6d4(arg0, 0x143d);
        field = *(int *)(data_ov002_022cf16c + (arg0 & 1) * 0x868);
        func_ov002_021df73c(arg0, (field + 5) / 5);
    }
    return 1;
}
