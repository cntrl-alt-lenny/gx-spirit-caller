/* CAMPAIGN-PREP candidate for func_02270ca8 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     CLASS D: :13 bitfield guard (lsl#19;lsr#19), inline mla index (no shared base bind), :15 mode-field dispatch; reload word0 at re-check
 *   risk:       struct-guessed: literal pool truncated so stride 0x868 / slot+0x30 / dispatch consts (_LIT3-6) inferred; func_021bc618 arg count unknown. Confirm offsets and the ba104 3rd-arg constants against the real table struct
 *   confidence: low
 */
/* CAMPAIGN-PREP candidate for func_ov002_02270ca8 (ov002, class D, MED tier).
 * UNVERIFIED + ITERATION-EXPECTED. Guard chain over the per-player cf16c table
 * (row = (player&1)*0x868), a 0x14-stride sub-array at row+0x30 whose element
 * has a :13 field at +0x30, then a dispatch on the cd300 :15 mode field.
 *
 * NOTE: the asm literal pool is truncated (only _LIT0 shown). The stride 0x868,
 * the cf16c base, and the dispatch constants (_LIT3/_LIT4 modes, _LIT5/_LIT6
 * 3rd args) are inferred from sibling 021c37f4/021c3754 and the mla shape.
 */
typedef unsigned int u32;

struct Hdr300 { u32 b0 : 1; u32 _u1 : 7; u32 f8 : 15; u32 _u23 : 9; };
/* 0x14-byte slot; member at +0x30 holds a :13 count/flag field. */
struct Slot14 { char _pad[0x30]; u32 f13 : 13; u32 _rest : 19; };

extern char data_ov002_022cd300[];
extern char data_ov002_022cf16c[];
extern int  func_ov002_021ba104(int player, int slot, int mode);
extern int  func_ov002_021bc288(int player, int slot);
extern int  func_ov002_021bc618(void);
extern int  func_ov002_021c23ac(int player, int slot);

int func_ov002_02270ca8(int player, int a, int b) {
    int slot = a + b;
    char *row;
    struct Slot14 *e;
    int mode;
    if (player != (int)((struct Hdr300 *)data_ov002_022cd300)->b0)
        return 0;
    if (slot > 4)
        return 0;
    row = data_ov002_022cf16c + (player & 1) * 0x868;
    e = (struct Slot14 *)(row + slot * 0x14);
    if (e->f13 == 0)
        return 0;
    if (func_ov002_021bc618() == 0) {
        if (player == (int)((struct Hdr300 *)data_ov002_022cd300)->b0
            && func_ov002_021bc288(player, slot) != 0)
            goto act;
        return 0;
    }
act:
    mode = (int)((struct Hdr300 *)data_ov002_022cd300)->f8;
    if (mode == 1) {
        if (func_ov002_021ba104(player, slot, 0) != 0)
            return 0x800;
        return 0;
    }
    if (mode == 2) {
        if (func_ov002_021c23ac(player, slot) == 0)
            return 0;
        if (func_ov002_021ba104(player, slot, 0) != 0)
            return 0x800;
        return 0;
    }
    return 0;
}
