/* CAMPAIGN-PREP candidate for func_021f93a0 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     bind r5=e,r4=r; mla (f0&1)*0x868+base; +0x18+0x400=0x418; +ip<<2
 *   risk:       address is built as mla((f0&1),0x868,base) then add #0x18, add #0x400, add ip<<2 (four insns, separate); if mwcc folds 0x18+0x400 to one #0x418 add or reorders ip<<2, the add chain diverges. permuter-class (addr add-chain ordering).
 *   confidence: low
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

extern unsigned char data_ov002_022cf16c[];
extern int func_ov002_0220898c(struct Entity *e, int arg);
extern int func_ov002_021f4a84(struct Entity *e, int arg);
extern int func_ov002_021b99b4(int a, int g);
extern void func_ov002_021d8128(void *p, int a, int b);

int func_ov002_021f93a0(struct Entity *e, int arg)
{
    int r;
    int ip;
    if (func_ov002_0220898c(e, arg) == 0)
        return -1;
    r = func_ov002_021f4a84(e, arg);
    if (r != 1)
        return r;
    ip = func_ov002_021b99b4(e->f0, e->g6);
    func_ov002_021d8128(data_ov002_022cf16c + (e->f0 & 1) * 0x868 + 0x418 + ip * 4, 0, 0);
    return r;
}
