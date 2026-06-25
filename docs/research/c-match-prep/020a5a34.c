/* CAMPAIGN-PREP candidate for func_020a5a34 (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     u16 counter i via cast; signed int count (ble/blt); mask base loaded once, held
 *   risk:       struct-guessed + permuter-class: arr_1e0 at +0x1e0 / Cfg.field4 at +0x4 inferred; and the i(ip) lsl#16;lsr#16 u16 wrap may schedule differently. Confirm the two struct offsets.
 *   confidence: med
 */
/* func_020a5a34 — "are bits 0..count-1 all set" test over a mask, leaf.
 *
 *   count = data_021a9928.field4;            // int @ +0x4
 *   if (count <= 0) return 1;
 *   mask = (*data_021a9924).arr_1e0[idx-1];  // int @ base+0x1e0+(idx-1)*4
 *   for (i = 0; i < count; i = (u16)(i+1))
 *       if (((1 << i) & mask) == 0) return 0;
 *   return 1;
 */

typedef struct {
    char _pad_00[0x4];
    int  field4;     /* +0x4 */
} Cfg;

typedef struct {
    char _pad_00[0x1e0];
    int  arr_1e0[1]; /* +0x1e0, stride 4 */
} Bank;

extern Cfg   data_021a9928;
extern Bank *data_021a9924;

int func_020a5a34(int idx) {
    int            count = data_021a9928.field4;
    unsigned short i;
    int            mask;

    if (count <= 0) return 1;

    mask = data_021a9924->arr_1e0[idx - 1];

    i = 0;
    do {
        if (((1 << i) & mask) == 0) return 0;
        i = (unsigned short)(i + 1);
    } while (i < count);

    return 1;
}
