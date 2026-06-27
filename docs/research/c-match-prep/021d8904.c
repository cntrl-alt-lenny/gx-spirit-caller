/* CAMPAIGN-PREP candidate for func_021d8904 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     D: two-bitfield compound hi*2+lsb; (player?0x8000:0)|0x43 arg-pack tail; signed idx<=0xa guard
 *   risk:       struct-guessed: lsb is bit13 not adjacent to hi(bit22), so hi*2+lsb must stay TWO bitfield reads (lsl#2;lsr#24 + lsl#18;lsr#31;add). If mwcc folds, the field offsets diverge. Confirm slot layout.
 *   confidence: med
 */
typedef unsigned short u16;

/* per-player row table: 0x868 bytes/player, indexed (player & 1) as a BYTE
 * offset. 0x14-stride slot array starts at (row + 0x30); slot word0 packs
 * a 13-bit id (bits 0-12), a 1-bit lsb (bit 13), and an 8-bit hi (bits 22-29).
 * The combined "level/value" = hi*2 + lsb. */
extern char data_ov002_022cf16c[];

struct Slot {
    unsigned id  : 13;   /* bits 0-12  (lsl#19;lsr#19)   */
    unsigned lsb : 1;    /* bit 13     (lsl#18;lsr#31)   */
    unsigned     : 8;    /* bits 14-21 gap              */
    unsigned hi  : 8;    /* bits 22-29 (lsl#2;lsr#24)   */
    unsigned char pad[16];
};

extern void func_ov002_021d899c(int player, int idx, int flag);
extern void func_ov002_021d479c(int packed, int a1, int a2, int a3);

void func_ov002_021d8904(int player, int idx, int val)
{
    struct Slot *s;
    int v;

    if (idx <= 0xa) {
        s = (struct Slot *)(data_ov002_022cf16c + (player & 1) * 0x868 + 0x30);
        v = s[idx].hi * 2 + s[idx].lsb;
        if (val == v)
            func_ov002_021d899c(player, idx, 1);
    }
    func_ov002_021d479c((u16)((player ? 0x8000 : 0) | 0x43),
                        (u16)idx, (u16)val, 0);
}
