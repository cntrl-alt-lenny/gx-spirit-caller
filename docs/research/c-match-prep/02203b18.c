/* CAMPAIGN-PREP candidate for func_02203b18 (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     decl-order i/j/e; bitfield :13 forces lsl19/lsr19; pointer-walk for +0x14
 *   risk:       orig holds parity-base in r4 + stride 0x868 in r9 across the loop; mwcc may fold &arr[i&1] into a single mla per-iter instead of hoisting (mla i,0x868,r4) — reshape-able via index split, else permuter-class scheduling.
 *   confidence: med
 */
#include "types.h"

typedef struct Entry_b18 {
    u32 code : 13;
    u32 rest : 19;
    u8 pad[0x10];
} Entry_b18; /* 0x14 bytes */

typedef struct Block_b18 {
    u8 head[0x94];
    Entry_b18 entries[5];
} Block_b18; /* 0x868 bytes */

extern Block_b18 data_ov002_022cf16c[2];
extern int func_ov002_021c2624(int i, int j, u32 code);

int func_ov002_02203b18(void) {
    int i;
    int j;
    Entry_b18 *e;
    for (i = 0; i < 2; i++) {
        e = &data_ov002_022cf16c[i & 1].entries[0];
        for (j = 5; j < 0xa; j++) {
            if (func_ov002_021c2624(i, j, e->code) != 0) {
                return 1;
            }
            e++;
        }
    }
    return 0;
}
