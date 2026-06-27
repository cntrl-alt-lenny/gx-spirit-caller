/* CAMPAIGN-PREP candidate for func_02218974 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     bit2 gate; 3-way state dispatch (cmp-order 7e/7f/80); inverted v<5 guard; cd744[b0]==1 store-result
 *   risk:       reshape-able (dispatch-order): mwcc may emit a `sub;cmp;addls pc` jump-table for the contiguous 0x7e/0x7f/0x80 where orig used 3 cmp;beq (or vice-versa); flip if/switch form to steer. struct-guessed: d0e6c+0xb2/+0xb0 and d016c+0xd44 offsets inferred.
 *   confidence: med
 */
typedef unsigned short u16;

struct Self02218974 {
    u16 id;                          /* +0 */
    u16 b0 : 1; u16 f5 : 5; u16 : 10;/* +2 */
    u16 : 2; u16 b2 : 1;             /* +4 bit2 */
};

extern int  data_ov002_022cd744[];
extern char data_ov002_022ce288[];
extern char data_ov002_022cf178[];
extern char data_ov002_022d016c[];
extern char data_ov002_022d0e6c[];
extern void func_ov002_021ae664(int a);
extern int  func_ov002_021b00d0(int a);
extern void func_ov002_021e104c(int player, int v);
extern void func_ov002_021e276c(int player, int id, int a, int b);
extern void func_ov002_0226b22c(int player, int f5, int a, int b);

int func_ov002_02218974(struct Self02218974 *self) {
    int state;
    if (self->b2) return 0;
    state = *(int *)(data_ov002_022ce288 + 0x5a8);
    if (state == 0x7e) {
        if (*(u16 *)(data_ov002_022d0e6c + 0xb2) != 0) {
            int v = *(int *)(data_ov002_022cf178 + (self->b0 & 1) * 0x868);
            if (v < 5) func_ov002_021e104c(self->b0, 5 - v);
        } else {
            func_ov002_021e276c(self->b0, self->id, 0x21, 0);
        }
        return 0xa;
    }
    if (state == 0x7f) {
        func_ov002_0226b22c(self->b0, self->f5, 1, *(int *)(data_ov002_022d016c + 0xd44));
        return 0x7e;
    }
    if (state == 0x80) {
        if (data_ov002_022cd744[self->b0] == 1) {
            *(int *)(data_ov002_022d016c + 0xd44) = func_ov002_021b00d0(2);
        } else {
            func_ov002_021ae664(0x38);
        }
        return 0x7f;
    }
    return 0;
}
