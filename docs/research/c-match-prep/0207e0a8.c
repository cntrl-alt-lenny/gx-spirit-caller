/* CAMPAIGN-PREP candidate for func_0207e0a8 (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     if-assign predicated stores; constants hoisted; counted 0..4 loop, stride struct
 *   risk:       orig hoists 0x20000/0x10000/0/1 to regs BEFORE loop and reuses; if mwcc re-materializes movs inside loop body the mov placement diverges. permuter-class (scheduling/hoist coin-flip).
 *   confidence: low
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

extern uint16_t data_021a08e0;
extern Entry data_02102120[];

void func_0207e0a8(void) {
    int n;
    int i;

    n = data_021a08e0;
    if (n > 1) {
        n++;
    }
    for (i = 0; i < 5; i++) {
        if (i < n) {
            data_02102120[i].field8 = 1;
        } else {
            data_02102120[i].field8 = 0;
        }
        if (data_02102120[i].fieldc != 0) {
            data_02102120[i].field0 = 0;
            data_02102120[i].field4 = 0x10000;
        } else {
            data_02102120[i].field0 = 0;
            data_02102120[i].field4 = 0x20000;
        }
    }
}
