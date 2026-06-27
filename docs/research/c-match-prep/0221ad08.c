/* CAMPAIGN-PREP candidate for func_0221ad08 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     bitfield b0:1+row:5 read-once; asymmetric raw shifts; packed-cmp operand-order hi8*2+bit13
 *   risk:       02257594 call: orig sets NO r1 (leftover reg=self from entry); passing `row` adds a `mov r1` the orig lacks (1 extra insn). reshape-able (drop/retune 2nd arg).
 *   confidence: med
 */
/* func_ov002_0221ad08 (cls D): validate self's (player,row) slot against the
 * cf16c row word, gate on cf1a4, then on 02257594, then forward two packed
 * fields of self+0x14 to 021de4b0. Always returns 0. */
typedef unsigned short u16;

/* self+2 : bit0 = player flag, bits[5:1] = row index (one ldrh, two fields). */
struct Self { u16 f0; u16 b0 : 1; u16 row : 5; u16 _r : 10; };

extern char data_ov002_022cf16c[];   /* row table, 0x868/player */
extern u16  data_ov002_022cf1a4[];   /* parallel gate table, 0x868/player */

extern int func_ov002_021de4b0(int self, int a, int b);
extern int func_ov002_02257594(void *self, int idx);

int func_ov002_0221ad08(struct Self *self) {
    int player = self->b0 & 1;
    int row = self->row;
    int word = *(int *)(data_ov002_022cf16c + player * 0x868 + row * 0x14 + 0x30);
    int c;
    if ((unsigned)(*(u16 *)((char *)self + 4) << 17) >> 23 !=
        (((unsigned)(word << 2) >> 24) << 1) + ((unsigned)(word << 18) >> 31))
        return 0;
    if (*(u16 *)((char *)data_ov002_022cf1a4 + player * 0x868 + row * 0x14) == 0)
        return 0;
    if (func_ov002_02257594(self, row) == 0)
        return 0;
    c = *(int *)((char *)self + 0x14);
    func_ov002_021de4b0((int)self, (unsigned)(c << 22) >> 31, (unsigned)(c << 18) >> 28);
    return 0;
}
