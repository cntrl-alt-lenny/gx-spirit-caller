/* CAMPAIGN-PREP candidate for func_021d8128 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     D: if-assign flag=arg0?0x8000:0 and b=arg2?1:0; Ov002Key a*2+b; const p1=0xe; (u16) packs
 *   risk:       reshape-able: the two `?:` value-maps must be if-assign form (`v=0;if(x)v=N;`) to get mov#0;movne#N matching movne/moveq order; if mwcc reorders the final p0/p2/p3 (u16) truncations the strh/lsl order diverges (store-order class).
 *   confidence: med
 */
/* func_ov002_021d8128 (ov002, cls D): arg-pack tail into 021d479c. p0 = flag|0x33
 * (flag=arg0?0x8000:0), p1 = 0xe const, p2 = (arg2?1:0) bool, p3 = Ov002Key a*2+b
 * extract of *(u32*)arg1. arg1 is a record pointer. */
typedef unsigned short u16;
typedef unsigned int   u32;

struct Ov002Key { u32 id : 13; u32 b : 1; u32 : 8; u32 a : 8; u32 : 2; };

extern int func_ov002_021d479c(int p0, int p1, int p2, int p3);

void func_ov002_021d8128(int arg0, void *arg1, int arg2) {
    struct Ov002Key *rec = (struct Ov002Key *)arg1;
    int flag = (arg0 != 0) ? 0x8000 : 0;
    int b = (arg2 != 0) ? 1 : 0;
    func_ov002_021d479c((u16)(flag | 0x33), 0xe, (u16)b, (u16)(rec->a * 2 + rec->b));
}
