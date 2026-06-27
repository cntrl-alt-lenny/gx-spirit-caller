/* CAMPAIGN-PREP candidate for func_022025f4 (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     inline-product CSE (no base fuse); :1/:4 bitfields; <= value-map direct
 *   risk:       Orig keeps player*0x868 (lr) and row*0x14 (ip) as two separate CSE'd products reused on both arrays; if mwcc folds them into one combined offset the two ldr address-builds diverge. reshape-able (keep products inline, don't introduce a combined off local).
 *   confidence: med
 */
/* func_ov002_022025f4 (cls C): per-player slot guard.
 * Reads a u32 at self+0x14 -> player = bit9, row = bits[10..13] (4-bit field).
 * Two parallel per-player arrays keyed by player*0x868 + row*0x14:
 *   data_022cf16c : Ov002Slot at +0x30 (13-bit id; bail if 0)
 *   data_022cf1a4 : u16 (bail if 0)
 * Tail: func_021c8470(player,row) <= 0x578 ? 1 : 0.
 * The two index products (player*0x868, row*0x14) are CSE'd SEPARATELY across
 * both arrays (orig keeps lr=player*0x868, ip=row*0x14) -> inline each product,
 * do NOT fold into one combined offset (would defeat the dual-product CSE). */

typedef unsigned short u16;

struct W14 { unsigned int _0 : 9; unsigned int player : 1; unsigned int row : 4; };
struct F022025f4_Self { unsigned int _pad[5]; struct W14 w14; };
struct Ov002Slot { unsigned int id : 13; };

extern char data_ov002_022cf16c[];
extern char data_ov002_022cf1a4[];
extern int  func_ov002_021c8470(int player, int row);

int func_ov002_022025f4(struct F022025f4_Self *self) {
    int player = self->w14.player;
    int row = self->w14.row;
    if (((struct Ov002Slot *)(data_ov002_022cf16c + player * 0x868 +
                              row * 0x14 + 0x30))->id == 0)
        return 0;
    if (*(u16 *)(data_ov002_022cf1a4 + player * 0x868 + row * 0x14) == 0)
        return 0;
    return func_ov002_021c8470(player, row) <= 0x578;
}
