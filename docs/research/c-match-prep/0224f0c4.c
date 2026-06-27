/* CAMPAIGN-PREP candidate for func_0224f0c4 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     :13 bitfield id (1st load) + RELOAD raw word for asymmetric tag shifts; ce288[0x48c]->+0xc ldrh compare
 *   risk:       orig reloads arr[idx] for the tag (ldr,...,ldr); mwcc may instead CSE the bitfield+raw reads into one ldr, dropping the 2nd load. reshape-able (force reload) / else permuter-class.
 *   confidence: med
 */
/* func_ov002_0224f0c4: decode slot word arr[idx] at (player row)+0x120; if its
 * :13 id is live (func_0202e234) and func_0202b878(id)==0xb, build a packed tag
 * (bits[29:22]<<1 + bit13) from the RELOADED word, resolve func_021c38c4, and
 * if it equals the cur halfword at ce288[0x48c]+0xc and func_021ca440(player,id)
 * passes, post list event 0xb. (cls D: :13 bitfield + asymmetric tag shifts.) */
typedef unsigned short u16;
typedef unsigned int   u32;

struct Slot13 { unsigned int id : 13; };

extern char data_ov002_022cf16c[];              /* row table 0x868/player (_LIT1) */
extern char data_ov002_022ce288[];              /* ptr table (_LIT2), +0x48c -> obj */

extern int func_0202e234(int id);
extern int func_0202b878(int id);
extern int func_ov002_021c38c4(int player, int tag);
extern int func_ov002_021ca440(int player, int id);
extern int func_ov002_02253458(int player, int kind, int idx);

void func_ov002_0224f0c4(int player, int unused, int idx) {
    char *base;
    int id;
    u32 word;
    int tag;
    int r;
    base = data_ov002_022cf16c + (player & 1) * 0x868 + 0x120;
    id = ((struct Slot13 *)base)[idx].id;
    if (func_0202e234(id) == 0)
        return;
    if (func_0202b878(id) != 0xb)
        return;
    word = ((u32 *)base)[idx];
    tag = (((word << 2) >> 24) << 1) + ((word << 18) >> 31);
    r = func_ov002_021c38c4(player, tag);
    if (*(u16 *)(*(int *)(data_ov002_022ce288 + 0x48c) + 0xc) != r)
        return;
    if (func_ov002_021ca440(player, id) == 0)
        return;
    func_ov002_02253458(player, 0xb, idx);
}
