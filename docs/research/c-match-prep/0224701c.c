/* CAMPAIGN-PREP candidate for func_0224701c (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     mla per-player base (player&1)*0x868; row+=0x14 IV; cmp self,player guard
 *   risk:       Orig reserves callee-saved r4=0 for func_021c1d28's 3rd arg (never written); my literal 0 emits mov r2,#0 instead, dropping r4 from the push list and re-colouring all regs. reshape-able: add local int z=0 forwarded (uncertain mwcc keeps the reg).
 *   confidence: low
 */
/* func_ov002_0224701c (cls C): 2x5 nested scan, per-player row base via mla,
 * accumulate func_021c84e0 over slots passing the guard chain. */
typedef unsigned char  u8;
typedef unsigned short u16;
typedef unsigned int   u32;

extern char data_ov002_022cf16c[];   /* per-player row table, 0x868/player */
extern int  func_ov002_021bc8c8(int self, int player, int idx);
extern int  func_ov002_021c1d28(int player, int idx, int z);
extern int  func_ov002_021c84e0(int player, int idx);

int func_ov002_0224701c(int self) {
    int total;
    int player;
    int idx;

    total = 0;
    for (player = 0; player < 2; player++) {
        char *row = data_ov002_022cf16c + (player & 1) * 0x868;
        for (idx = 0; idx < 5; idx++) {
            if (func_ov002_021bc8c8(self, player, idx) != 0)
                continue;
            if (func_ov002_021c1d28(player, idx, 0) != 0)
                continue;
            if (self != player && *(u16 *)(row + idx * 0x14 + 0x38) == 0)
                continue;
            total += func_ov002_021c84e0(player, idx);
        }
    }
    return total;
}
