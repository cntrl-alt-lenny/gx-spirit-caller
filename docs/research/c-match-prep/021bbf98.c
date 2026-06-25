/* CAMPAIGN-PREP candidate for func_021bbf98 (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     bind call result in r0/count across guards; early return on !(d0&1); :13 bitfields; source-order guards
 *   risk:       count must stay live in r0 across the two global reads (orig adds to r0 in place via addne). If mwcc spills/reloads count the addne folding diverges. reshape-able (single accumulator var).
 *   confidence: high
 */
/* func_ov002_021bbf98 : helper call then two global id-match bonuses on its result */
typedef struct {
    int f0;
    int f4;
    char _p8[0xb8];          /* +0x08 .. 0xbf */
    unsigned int c4:13;      /* +0xc4 */
    unsigned int :19;
    char _pc8[0x10];
    unsigned int d8:13;      /* +0xd8 */
    unsigned int :19;
} Tbl3F4;

typedef struct {
    char _p0[0xd0];
    unsigned int d0;         /* +0xd0 */
} Tbl016C;

extern Tbl3F4 data_ov002_022cd3f4;
extern Tbl016C data_ov002_022d016c;
extern int func_ov002_021bbf50(int side);

int func_ov002_021bbf98(int side)
{
    int count = func_ov002_021bbf50(side);
    if (!(data_ov002_022d016c.d0 & 1)) return count;
    if (side == data_ov002_022cd3f4.f0) {
        if (data_ov002_022cd3f4.c4 != 0) count++;
    }
    if (side == data_ov002_022cd3f4.f4) {
        if (data_ov002_022cd3f4.d8 != 0) count++;
    }
    return count;
}
