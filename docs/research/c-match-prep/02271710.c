/* CAMPAIGN-PREP candidate for func_02271710 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     CLASS D: :1 bit0 + :9 hi9 (lsr#23) bitfields; flag=(n>=7) as movge/movlt if-assign; unsigned >= for movcs; inline mul index
 *   risk:       permuter-class: orig interleaves the func_021c38c4 result, the ge-flag movge/movlt, and the mul/mla index load before the cmp — a scheduling/reg order C reshape likely won't reproduce; also bit0 reused 2x from held word0
 *   confidence: low
 */
/* CAMPAIGN-PREP candidate for func_ov002_02271710 (ov002, class D, MED tier).
 * UNVERIFIED + ITERATION-EXPECTED. Guard bit0==arg0, 5<=slot<10,
 * func_021bb068(0x13f2)==0, func_021baca8(arg0,slot,0x19b2)!=0. Then
 * n = func_021c38c4(bit0, word0>>23); flag = (n>=7); read int from cf1a8 table
 * (row=(arg0&1)*0x868, stride 0x14); if (unsigned)val >= flag+1 -> 0x800.
 */
typedef unsigned int u32;

struct Hdr300 { u32 b0 : 1; u32 _u1 : 7; u32 f8 : 15; u32 hi9 : 9; };

extern char data_ov002_022cd300[];
extern char data_ov002_022cf1a8[];
extern int  func_ov002_021baca8(int player, int slot, int tag);
extern int  func_ov002_021bb068(int tag);
extern int  func_ov002_021c38c4(int player, unsigned int hi9);

int func_ov002_02271710(int player, int a, int b) {
    int slot = a + b;
    u32 w;
    int n, flag;
    unsigned int val;
    if ((int)((struct Hdr300 *)data_ov002_022cd300)->b0 != player)
        return 0;
    if (slot < 5)
        return 0;
    if (slot >= 0xa)
        return 0;
    if (func_ov002_021bb068(0x13f2) != 0)
        return 0;
    if (func_ov002_021baca8(player, slot, 0x19b2) == 0)
        return 0;
    w = *(u32 *)data_ov002_022cd300;
    n = func_ov002_021c38c4((int)((struct Hdr300 *)&w)->b0, w >> 0x17);
    flag = n >= 7;
    val = *(unsigned int *)(data_ov002_022cf1a8
                            + (((struct Hdr300 *)&w)->b0 & 1) * 0x868
                            + slot * 0x14);
    if (val >= (unsigned int)(flag + 1))
        return 0x800;
    return 0;
}
