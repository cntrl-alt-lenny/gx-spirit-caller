/* CAMPAIGN-PREP candidate for func_021f82b8 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     bitfield f0:1; bind base=(a&1)*0x868+b*0x14; :13 via <<19>>19; two derefs
 *   risk:       orig holds (a&1)*0x868 in lr and b*0x14 in ip across both pointer forms (mla into [r,#0x30] and ldrh [ip,r]); if mwcc materializes one combined base only, ip-reuse for the u16 ldrh diverges. permuter-class (addr-CSE coin-flip).
 *   confidence: low
 */
typedef unsigned short u16;

struct Entity {
    u16 unk0;
    u16 f0 : 1;
};

struct Rec {
    unsigned char pad30[0x30];
    int field30 : 13;
};

extern unsigned char data_ov002_022cf16c[];
extern unsigned char data_ov002_022cf1a4[];
extern int func_ov002_021b9e00(int a, int b);

int func_ov002_021f82b8(struct Entity *e, int a, int b)
{
    int base;
    int *p;
    u16 *q;
    if (((struct Entity *)e)->f0 != a)
        return 0;
    base = (a & 1) * 0x868 + b * 0x14;
    p = (int *)(data_ov002_022cf16c + base + 0x30);
    if (((*p << 0x13) >> 0x13) == 0)
        return 0;
    q = (u16 *)(data_ov002_022cf1a4 + base);
    if (*q == 0)
        return 0;
    return func_ov002_021b9e00(a, b) != 0;
}
