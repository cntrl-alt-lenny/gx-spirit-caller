/* CAMPAIGN-PREP candidate for func_0223def4 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     idx<5?arr8:ce720[(f18+idx-5)%128] (signed mod->ror); raw asymmetric extract
 *   risk:       the `addlt r0,#8; addlt r0,r1,lsl#1` fuses the <5 path into r0 in two adds before the branch; mwcc may compute &arr8[idx] differently or hoist the ldrh. likely reshape-able (mirrors shipped 0223de94 which matched).
 *   confidence: med
 */
/* func_ov002_0223def4: leaf. For idx<5 read self->arr8[idx]; else the
 * ce720 ring at (self->f18 + idx - 5) %% 128. Return the 5-bit field at
 * bit offset 5 of that u16 ((x<<18)>>23). Sibling of shipped 0223de94. */
typedef unsigned char  u8;
typedef unsigned short u16;

struct Node0223def4 {
    char _pad[8];
    u16 arr8[5];   /* +8 */
    u16 f18;       /* +0x12 */
};

extern u16 data_ov002_022ce720[];

int func_ov002_0223def4(struct Node0223def4 *self, int idx) {
    u16 *p;
    if (idx < 5) {
        p = &self->arr8[idx];
    } else {
        int n = (self->f18 + idx - 5) % 128;
        p = &data_ov002_022ce720[n];
    }
    return (unsigned)((u16)*p << 18) >> 23;
}
