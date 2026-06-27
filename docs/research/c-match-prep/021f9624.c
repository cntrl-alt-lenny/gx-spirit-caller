/* CAMPAIGN-PREP candidate for func_021f9624 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     bind r4=sel; ent=*(+0x48c); f0:1 cmp; mla (sel&1)*0x868; :13; rsb 1-sel
 *   risk:       mla((sel&1),0x868,cf16c)+idx<<2 then [r,#0x120]; and `rsb r1,r4,#1` = (1-sel) feeds func_02257ab8. If mwcc emits sub/rsb differently or splits the mla, addr+arg diverge. permuter-class (mla fusion + rsb form).
 *   confidence: low
 */
typedef unsigned short u16;

struct Entity {
    u16 unk0;
    u16 f0 : 1;
    u16 unk4;
    u16 unk6;
    u16 unk8;
    u16 unka;
    u16 fc;
};

struct Globals { unsigned char pad[0x48c]; struct Entity *ent; };
extern struct Globals data_ov002_022ce288;
extern unsigned char data_ov002_022cf16c[];

extern u16 func_0202b950(int x);
extern int func_0202e234(int x);
extern int func_ov002_02257ab8(int a, int b);

int func_ov002_021f9624(int sel, int arg, int idx)
{
    int v;
    if (sel != data_ov002_022ce288.ent->f0)
        return 0;
    if (arg == 0xb) {
        v = (*(int *)(data_ov002_022cf16c + (sel & 1) * 0x868 + idx * 4 + 0x120) << 0x13) >> 0x13;
        data_ov002_022ce288.ent->fc = func_0202b950(v);
        if (func_0202e234(v) != 0) {
            if (data_ov002_022ce288.ent->fc != 0xffff) {
                if (func_ov002_02257ab8(1 - sel, 0) != 0)
                    return 0x800;
            }
        }
    }
    return 0;
}
