/* CAMPAIGN-PREP candidate for func_021e99a4 (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     CLASS C+D: :13 bitfield for lsl;lsr; chained mla via byte-array index; if-return guard chain
 *   risk:       orig chains mla(lr,r3,ip) then mla(r4,#0x14,ip) into ONE address reg; if mwcc splits into mul+add (two regs), the address sequence diverges. reshape-able (keep single (slot&1)*0x868+index*0x14 expr).
 *   confidence: med
 */
typedef unsigned short u16;
typedef unsigned int u32;

struct CardEnt30 { u32 _pad[12]; u32 flags : 13; };

extern char data_ov002_022cf16c[];
extern int func_ov002_021c1e44(void);
extern int func_ov002_021c1ef0(int a, int slot, int index);
extern int func_ov002_021c2084(int a, int slot, int index, int mode);

int func_ov002_021e99a4(int a, int slot, int index)
{
    struct CardEnt30 *e;

    if (index >= 5)
        return 0;

    e = (struct CardEnt30 *)(data_ov002_022cf16c + (slot & 1) * 0x868 + index * 0x14);
    if (e->flags == 0)
        return 0;

    if (func_ov002_021c1e44() != 0)
        return 0;
    if (func_ov002_021c1ef0(a, slot, index) == 0)
        return 0;
    if (func_ov002_021c2084(a, slot, index, 1) != 0)
        return 1;
    return 0;
}
