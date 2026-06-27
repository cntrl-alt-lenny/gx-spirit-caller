/* CAMPAIGN-PREP candidate for func_02211824 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     switch (not if-chain) for branch-blocks; :1 bitfield; clamp as if-assign; cf17c byte-offset; state dispatch
 *   risk:       Compile-verified IDENTICAL except `s` allocated to ip vs orig r3 (a callee/scratch coin-flip on the only call-spanning local). permuter-class.
 *   confidence: med
 */
typedef unsigned short u16;
struct F02211824_F2 { u16 bit0 : 1; u16 rest : 15; };
struct F02211824_Self { u16 id; struct F02211824_F2 f2; };
extern char data_ov002_022ce288[];
extern int  data_ov002_022cf17c[];
extern int  data_ov002_022cd744[];
extern int  func_ov002_021ae400(int a, int b);
extern int  func_ov002_021af9d0(int a, int b, int c, int d);
extern int  func_ov002_021e1bf8(int a);
int func_ov002_02211824(struct F02211824_Self *self) {
    int s = 0;
    int state;
    switch (self->id) {
    case 0x1051: s = 5; break;
    case 0x162c: s = 3; break;
    case 0x184c: s = 3; break;
    }
    state = *(int *)(data_ov002_022ce288 + 0x5a8);
    if (state == 0x7e) { func_ov002_021e1bf8(self->f2.bit0); return 0; }
    if (state == 0x7f) {
        if (s >= 0x20) s = 0x20;
        func_ov002_021af9d0(self->f2.bit0, s + 6, 0, 0);
        return 0x7e;
    }
    if (state == 0x80) {
        int bit = self->f2.bit0;
        if (*(int *)((char *)data_ov002_022cf17c + bit * 0x868) == 0) return 0;
        if (data_ov002_022cd744[bit] == 1) return 0;
        func_ov002_021ae400(bit, 0xf5);
        return 0x7f;
    }
    return 0;
}
