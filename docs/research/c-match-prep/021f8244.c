/* CAMPAIGN-PREP candidate for func_021f8244 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     bind r4=e; guard call; :2 bitfield as bool (movs/bne); :1/:5 unpacks
 *   risk:       the `mov;movs lsr#1e;bne` tests f12:2 nonzero in one shot; if mwcc loads f12 then cmp #0 instead of movs, one instruction diverges. reshape-able (keep as if(e->f12)).
 *   confidence: med
 */
typedef unsigned short u16;

struct Entity {
    u16 unk0;
    u16 f0 : 1;
    u16 f1 : 5;
    u16 f6 : 6;
    u16 f12 : 2;
};

extern int func_ov002_021f60fc(struct Entity *e);
extern void func_ov002_021d91e0(int a, int b, int c);

int func_ov002_021f8244(struct Entity *e)
{
    if (func_ov002_021f60fc(e) == 0)
        return 0;
    if (e->f12 == 0)
        func_ov002_021d91e0(e->f0, e->f1, 3);
    return 1;
}
