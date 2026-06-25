/* CAMPAIGN-PREP candidate for func_0207e1c4 (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     5x &base[arg] => mla x*0x18+base; bind base once; store ascending order
 *   risk:       orig binds base data_02102120 in r6 across all 5 mla and out-ptr in r0 once; if mwcc reloads base or doesn't fold *0x18 into mla (uses separate mul) the 5 address computes diverge. reshape-able (single base local / pointer-index).
 *   confidence: med
 */
#include <stdint.h>

typedef struct {
    int field0;
    int field4;
    int field8;
    int fieldc;
    int field10;
    int field14;
} Entry;

extern Entry data_02102120[];
extern Entry *data_0210210c[];

void func_0207e1c4(int a, int b, int c, int d, int e) {
    data_0210210c[0] = &data_02102120[a];
    data_0210210c[1] = &data_02102120[b];
    data_0210210c[2] = &data_02102120[c];
    data_0210210c[3] = &data_02102120[d];
    data_0210210c[4] = &data_02102120[e];
}
