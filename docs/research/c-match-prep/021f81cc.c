/* CAMPAIGN-PREP candidate for func_021f81cc (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     bind r4=e; :1/:5 bitfields; reload [r4+2] before second call; strh +0xa
 *   risk:       orig RELOADS ldrh [r4,#2] for the second call; if mwcc caches unpacked fields across the call, ldrh placement diverges. reshape-able (re-read e->f0/f1).
 *   confidence: med
 */
typedef unsigned short u16;

struct Entity {
    u16 unk0;
    u16 f0 : 1;
    u16 f1 : 5;
    u16 f6 : 6;
    u16 f12 : 2;
    u16 unk4;
    u16 unk6;
    u16 unk8;
    u16 fa;
};

extern u16 func_ov002_021b9bd4(int a, int b);
extern void func_ov002_021decdc(struct Entity *e, int a, int b);

int func_ov002_021f81cc(struct Entity *e)
{
    e->fa = func_ov002_021b9bd4(e->f0, e->f1);
    func_ov002_021decdc(e, e->f0, e->f1);
    return 1;
}
