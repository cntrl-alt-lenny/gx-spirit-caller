/* CAMPAIGN-PREP candidate for func_021eac88 (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     CLASS C+D: load *(base+0xcec) as call arg; single mla halfword-table index; bool from ldrh
 *   risk:       orig does mla r0,(slot&1),0x868,cf1a4 then ldrh [index*0x14, r0] — one mla for the half-base, mul for row. If mwcc fuses or reorders the two scaled terms, address regs diverge. reshape-able (keep terms separate).
 *   confidence: med
 */
typedef unsigned short u16;
typedef unsigned int u32;

extern char data_ov002_022cf1a4[];
extern char *data_ov002_022d016c;
extern int func_ov002_021bc8c8(void *p);

int func_ov002_021eac88(int a, int slot, int index)
{
    void *p;

    p = *(void **)((char *)&data_ov002_022d016c + 0xcec);
    if (func_ov002_021bc8c8(p) == 0)
        return 0;

    if (*(u16 *)(data_ov002_022cf1a4 + (slot & 1) * 0x868 + index * 0x14) != 0)
        return 1;
    return 0;
}
