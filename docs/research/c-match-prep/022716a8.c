/* CAMPAIGN-PREP candidate for func_022716a8 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     CLASS D: card :8@bit22 + :1@bit13 bitfields (lsl#2;lsr#24 / lsl#18;lsr#31); (f22<<1)+b13 operand-order; bind word0 once into w, reuse for b0 and >>23
 *   risk:       orig holds word0 in one reg (ip) for BOTH bit0 and the >>23 compare; reading via ((Hdr300*)&w) twice may spill or reload. reshape-able (keep single u32 w bound); struct-guessed on the card :8/:8/:1 layout
 *   confidence: med
 */
/* CAMPAIGN-PREP candidate for func_ov002_022716a8 (ov002, class D, MED tier).
 * UNVERIFIED + ITERATION-EXPECTED. Leaf. Guard arg0==bit0 && arg1==0xb, then
 * read card = ((int*)(cf16c_row + 0x120))[arg2]; compute
 * lvl = ((card>>22)&0xff)*2 + ((card>>13)&1) via bitfields; compare to the
 * cd300 :9 field (word0>>23). Mismatch -> 0x800, else 0.
 */
typedef unsigned int u32;

struct Hdr300 { u32 b0 : 1; u32 _u1 : 7; u32 f8 : 15; u32 hi9 : 9; }; /* @0x00 */
/* card word: id:13, bit13:1, :8 mid, :8 at bit22, :2 top */
struct Card { u32 id : 13; u32 b13 : 1; u32 _mid : 8; u32 f22 : 8; u32 _top : 2; };

extern char data_ov002_022cd300[];
extern char data_ov002_022cf16c[];

int func_ov002_022716a8(int player, int kind, int idx) {
    u32 w = *(u32 *)data_ov002_022cd300;
    struct Card *c;
    int lvl;
    if (player != (int)(((struct Hdr300 *)&w)->b0) || kind != 0xb)
        return 0;
    c = (struct Card *)((data_ov002_022cf16c + (player & 1) * 0x868 + 0x120)
                        + idx * 4);
    lvl = c->f22 * 2 + c->b13;
    if (lvl != (int)(w >> 0x17))
        return 0x800;
    return 0;
}
