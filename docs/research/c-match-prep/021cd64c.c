/* CAMPAIGN-PREP candidate for func_021cd64c (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     D: smulbb stride + :13 Ov002Slot bitfield (lsl#19;lsr#19), single guard
 *   risk:       None material: this is the already-shipped matched .c on main (src/overlay002/func_ov002_021cd64c.c) reproduced verbatim. reshape-able if pool/reloc shifts.
 *   confidence: high
 */
/* func_ov002_021cd64c: if player (high-bit flag) row slot idx has a non-zero
 * :13 id, bump the d016c+0xce8 counter (store its low half into slot+4), set
 * the cf1ac flag bit via 021c9b80, post event 0x24; always clear ce950+0x80c.
 * (cls D: smulbb stride + lsl#19;lsr#19 :13 bitfield, single guard.) */

typedef unsigned short u16;

struct Ov002Slot { unsigned int id : 13; };

extern char data_ov002_022ce950[];   /* per-player field table (+0x80c scalar) */
extern char data_ov002_022cf16c[];   /* row table, 0x868/player               */
extern char data_ov002_022d016c[];   /* +0xce8 counter block                  */

extern void func_ov002_021c9b80(int player, int row, int bit, int set);
extern int  func_ov002_0229ade0(int cmd, int a, int b, int c);

void func_ov002_021cd64c(void) {
    int flag = (*(u16 *)data_ov002_022ce950 & 0x8000) ? 1 : 0;
    int idx = *(u16 *)(data_ov002_022ce950 + 2);
    struct Ov002Slot *slot = (struct Ov002Slot *)(data_ov002_022cf16c +
                             (flag & 1) * 0x868 + (idx & 0xff) * 20 + 0x30);
    if (slot->id != 0) {
        int n = *(int *)(data_ov002_022d016c + 0xce8) + 1;
        *(int *)(data_ov002_022d016c + 0xce8) = n;
        *(u16 *)((char *)slot + 4) = (u16)n;
        func_ov002_021c9b80(flag, idx & 0xff, 1, 0);
        func_ov002_0229ade0(0x24, 0, 0, 0);
    }
    *(int *)(data_ov002_022ce950 + 0x80c) = 0;
}
