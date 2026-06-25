/* CAMPAIGN-PREP candidate for func_02296240 (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     guard chain reload f0; final (1-f0)&1*stride index; cmp#0x7d0
 *   risk:       reshape-able: func_021be4a0 receives r0=f0 (bit0), r1=5-bit, r2=1 in a fixed reg order; if mwcc evaluates args in a different order the mov/lsr sequence reshuffles — keep arg order (f0, f5, 1).
 *   confidence: med
 */
// func_ov002_02296240 — long guard chain, bank-index final cmp
typedef struct Obj Obj;
struct Obj { unsigned short pad0; unsigned short flags; };

extern int func_ov002_02259f74(int f0);
extern int func_ov002_021be4a0(int a, int b, int c);
extern int func_ov002_021bb068(int id);
extern int func_ov002_021bbf50(int x);
extern int data_ov002_022cf16c[];   // stride 0x868

int func_ov002_02296240(Obj *obj)
{
    if (func_ov002_02259f74(obj->flags & 1) == 0)
        return 0;
    if (func_ov002_021be4a0((obj->flags >> 0) & 1,
                            (obj->flags >> 1) & 0x1f, 1) == 0)
        return 0;
    if (func_ov002_021bb068(0x17a6) != 0)
        return 0;
    if (func_ov002_021bbf50(1 - (obj->flags & 1)) == 0)
        return 0;

    {
        int idx = ((1 - (obj->flags & 1)) & 1) * 0x868;
        if (*(int *)((char *)data_ov002_022cf16c + idx) < 0x7d0)
            return 1;
        return 0;
    }
}
