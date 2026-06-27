/* CAMPAIGN-PREP candidate for func_02217450 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     bit2/bit0 bitfields; rsb 1-b0 arg; -1 and 0xffff literals; reload b0
 *   risk:       orig reloads +2 for each b0 (two ldrh) — separate bitfield reads match this; main wobble is whether mwcc CSEs the two b0 reads into one. reshape-able (force reload if CSE'd). Cleanest in batch.
 *   confidence: med
 */
/* func_ov002_02217450 (ov002, class D) — bit2 guard, bit0 (1-b0) via rsb,
 * two gated sinks. */
typedef unsigned short u16;
extern int func_ov002_021bcd80(int a, int b);
extern int func_ov002_0226aff0(int a, int b, int c);

struct Self02217450 {
    u16 f0;            /* +0 */
    u16 b0  : 1;       /* +2 bit0 */
    u16 _p2 : 15;
    u16 _p4a : 2;      /* +4 bits[1:0] */
    u16 b2  : 1;       /* +4 bit2 */
    u16 _p4b : 13;
};

int func_ov002_02217450(struct Self02217450 *arg0) {
    if (arg0->b2 != 0) return 0;
    if (func_ov002_021bcd80(1 - arg0->b0, -1) == 0) return 0;
    func_ov002_0226aff0(1 - arg0->b0, 0xffff, 1);
    return 0;
}
