/* CAMPAIGN-PREP candidate for func_021f8560 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     bind r4=e,r5=arg; state==0 guard; f0:1 -> r0, g6:9 -> r3 args
 *   risk:       the 4-arg call wants r0=f0(:1 from [r4+2]), r3=g6(:9 from [r4+4]) with r1/r2 immediates; mwcc arg eval order may shuffle the two ldrh+shift pairs into different scratch regs. reshape-able (decl/eval order).
 *   confidence: med
 */
typedef unsigned short u16;

struct Entity {
    u16 unk0;
    u16 f0 : 1;
    u16 f1 : 5;
    u16 f6 : 6;
    u16 f12 : 2;
    u16 g0 : 6;
    u16 g6 : 9;
};

struct State { unsigned char pad[0x5b4]; int step; };
extern struct State data_ov002_022ce288;

extern void func_ov002_021e276c(int a, int b, int c, int d);
extern void func_ov002_021f4a4c(struct Entity *e, int arg);
extern void func_ov002_021fab74(struct Entity *e, int arg);

int func_ov002_021f8560(struct Entity *e, int arg)
{
    if (data_ov002_022ce288.step == 0) {
        func_ov002_021e276c(e->f0, 0x16b8, 1, e->g6);
        func_ov002_021f4a4c(e, arg);
    }
    func_ov002_021fab74(e, arg);
    return 0;
}
