/* CAMPAIGN-PREP candidate for func_02271608 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     CLASS D: :1 bit0 bitfield + rsb (1-bit0); inline mul index for u16 ldrh; if-assign movle/movgt for the >3 final flag
 *   risk:       func_021bc8c8 takes player TWICE (r0 left = arg0, r1=arg0, r2=slot) — if that double-pass is actually one arg + a different r0, the call args diverge. reshape-able (adjust signature) / struct-guessed on cf1a4 stride
 *   confidence: med
 */
/* CAMPAIGN-PREP candidate for func_ov002_02271608 (ov002, class D, MED tier).
 * UNVERIFIED + ITERATION-EXPECTED. arg0 must equal the OPPONENT (1 - bit0).
 * Reads a u16 from cf1a4 table (row = (arg0&1)*0x868, element stride 0x14),
 * then two validator calls; returns 0x800 if last call result <= 3.
 */
typedef unsigned int   u32;
typedef unsigned short u16;

struct Hdr300 { u32 b0 : 1; u32 _rest : 31; };

extern char data_ov002_022cd300[];
extern char data_ov002_022cf1a4[];
extern int  func_ov002_021bc8c8(int a, int player, int slot);
extern int  func_ov002_021c84e0(int player, int slot);

int func_ov002_02271608(int player, int a, int b) {
    int slot = a + b;
    if (slot > 4)
        return 0;
    if (player != 1 - (int)((struct Hdr300 *)data_ov002_022cd300)->b0)
        return 0;
    if (*(u16 *)(data_ov002_022cf1a4 + (player & 1) * 0x868 + slot * 0x14) == 0)
        return 0;
    if (func_ov002_021bc8c8(player, player, slot) == 0)
        return 0;
    if (func_ov002_021c84e0(player, slot) > 3)
        return 0;
    return 0x800;
}
