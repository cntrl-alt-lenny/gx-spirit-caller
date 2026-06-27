/* CAMPAIGN-PREP candidate for func_0221b5ac (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     bitfield b0:1+row:5 read-once; raw asymmetric shifts; packed-cmp operand-order; stack-arg via 5th param
 *   risk:       orig stores the stack arg (=1) BEFORE the in-reg args (str [sp] early); mwcc may order the `str [sp]` differently relative to the r0-r3 setup. reshape-able (declare/pass the const last as written) — minor scheduling otherwise.
 *   confidence: med
 */
/* func_ov002_0221b5ac (cls D): the cf16c/cf1a4 (player,row) row validate; on
 * pass, call 021d59cc(player, row, self.f0, 4, stack=1). Always returns 0. */
typedef unsigned short u16;
struct Self { u16 f0; u16 b0 : 1; u16 row : 5; u16 _r : 10; };

extern char data_ov002_022cf16c[];
extern u16  data_ov002_022cf1a4[];
extern int  func_ov002_021d59cc(int a, int b, int c, int d, unsigned short e);

int func_ov002_0221b5ac(struct Self *self) {
    int player = self->b0 & 1;
    int row = self->row;
    int word = *(int *)(data_ov002_022cf16c + player * 0x868 + row * 0x14 + 0x30);
    if ((unsigned)(*(u16 *)((char *)self + 4) << 17) >> 23 !=
        (((unsigned)(word << 2) >> 24) << 1) + ((unsigned)(word << 18) >> 31))
        return 0;
    if (*(u16 *)((char *)data_ov002_022cf1a4 + player * 0x868 + row * 0x14) != 0)
        func_ov002_021d59cc(player, row, *(u16 *)self, 4, 1);
    return 0;
}
