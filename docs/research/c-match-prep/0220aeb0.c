/* CAMPAIGN-PREP candidate for func_0220aeb0 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     D: leaf, :6 then :1 bitfield, strided *0x868 table, ne->return1 guard
 *   risk:       orig loads h0 once (r0) and derives both f6 and f0 from it; if mwcc re-loads [r0,#2] for f0 a second ldrh appears (reshape-able: single struct read; bind h2). stride/data struct-guessed.
 *   confidence: med
 */
typedef unsigned char u8;
typedef unsigned short u16;
typedef signed int s32;
typedef unsigned int u32;

struct Obj_0220aeb0 {
    u16 h0;          /* +0 */
    u16 f0 : 1;      /* +2 bit0 */
    u16 p2a : 5;
    u16 f6 : 6;      /* +2 bits6..11 */
    u16 p2b : 4;
};

extern u8 data_ov002_022cf178[];

s32 func_ov002_0220aeb0(struct Obj_0220aeb0 *p) {
    s32 t;
    if (p->f6 != 5) return 1;
    t = *(s32 *)(data_ov002_022cf178 + p->f0 * 0x868);
    return t != 0;
}
