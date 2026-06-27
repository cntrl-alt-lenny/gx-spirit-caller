/* CAMPAIGN-PREP candidate for func_021f0f7c (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     Bind parity-offset po and row-offset ro once; 13-bit bitfield via lsl#19;lsr#19
 *   risk:       a0 used as base with data_022cf1a4/ac as index (ldrh [r4,r0]); if mwcc swaps base/index operands the ldr addressing diverges. reshape-able (swap a0<->global in the add).
 *   confidence: med
 */
typedef unsigned char u8;
typedef unsigned short u16;
typedef unsigned int u32;

extern u8 data_ov002_022cf16c[];
extern u8 data_ov002_022cf1a4[];
extern u8 data_ov002_022cf1ac[];
extern int func_0202b878(int slot);
extern int func_0202b8c0(int slot);
extern int func_ov002_021b8fcc(int a, int b);

int func_ov002_021f0f7c(int a0, int a1, int a2)
{
    int po;
    int slot;
    int row;

    po  = (a1 & 1) * 0x868;
    row = a2 * 0x14;
    slot = (*(u32 *)(data_ov002_022cf16c + po + row + 0x30) << 0x13) >> 0x13;

    if (a2 < 5) {
        if (func_ov002_021b8fcc(a1, a2) == 0)
            return 0;
    }
    if (func_0202b878(slot) != 0x16)
        return 0;
    if (*(u16 *)((char *)a0 + (int)(data_ov002_022cf1a4 + po)) == 0)
        return 0;
    if (func_0202b8c0(slot) != 4)
        return 0;
    if ((*(u32 *)((char *)a0 + (int)(data_ov002_022cf1ac + po)) >> 9) & 1)
        return 0;
    return 1;
}
