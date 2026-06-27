/* CAMPAIGN-PREP candidate for func_021d8184 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     D: if-assign flag=arg0?0x8000:0; arg2 raw (u16); Ov002Key a*2+b; const p1=0xe
 *   risk:       reshape-able: flag map must be if-assign (mov#0;movne#0x8000); residual is the order of the four (u16) lsl#16/lsr#16 truncations feeding r0-r3 — if mwcc schedules them differently it is a 1-2 line near-miss (store/move-order class).
 *   confidence: med
 */
/* func_ov002_021d8184 (ov002, cls D): simpler 021d8128 variant — arg-pack tail into
 * 021d479c with p0 = flag|0x33, p1 = 0xe, p2 = arg2 passed raw (no bool), p3 =
 * Ov002Key a*2+b extract of *(u32*)arg1. */
typedef unsigned short u16;
typedef unsigned int   u32;

struct Ov002Key { u32 id : 13; u32 b : 1; u32 : 8; u32 a : 8; u32 : 2; };

extern int func_ov002_021d479c(int p0, int p1, int p2, int p3);

void func_ov002_021d8184(int arg0, void *arg1, int arg2) {
    struct Ov002Key *rec = (struct Ov002Key *)arg1;
    int flag = (arg0 != 0) ? 0x8000 : 0;
    func_ov002_021d479c((u16)(flag | 0x33), 0xe, (u16)arg2, (u16)(rec->a * 2 + rec->b));
}
