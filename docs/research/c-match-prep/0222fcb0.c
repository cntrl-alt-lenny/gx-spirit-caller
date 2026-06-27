/* CAMPAIGN-PREP candidate for func_0222fcb0 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     compound `f0==player && f1c==idx` (folds bitfield >>31/>>27 into cmp/cmpeq); state if-chain 0x7e/0x7f/0x80
 *   risk:       the short-circuit && must compile to cmp;ldreq;moveq;cmpeq;bne with the bitfield shifts folded into the second cmp; if mwcc materialises self->idx first it diverges -> reshape-able via the bitfield-vs-cmp fold (header lever); else permuter-class
 *   confidence: med
 */
typedef unsigned short u16;
struct ce288 { char _a[0x5a8]; int f5a8; };
struct cd3f4 { int f0; int f4; char _b[0x14]; int f1c; int f20; };
struct self_t { u16 f0; u16 player : 1; u16 idx : 5; };
extern struct ce288 data_ov002_022ce288;
extern struct cd3f4 data_ov002_022cd3f4;
extern char  data_ov002_022d016c[];
extern u16   data_ov002_022d0e6c[];
extern int   data_ov002_022cd744[];
extern int  func_ov002_021ae664(int x);
extern int  func_ov002_021b00d0(int x);
extern int  func_ov002_021de4b0(int self, int a, int b);
extern int  func_ov002_0226b22c(int player, int idx, int c, int d);
int func_ov002_0222fcb0(struct self_t *self) {
    int state = data_ov002_022ce288.f5a8;
    if (state == 0x7e) {
        if (*(u16 *)((char *)data_ov002_022d0e6c + 0xb2) == 0) return 0;
        if (data_ov002_022cd3f4.f0 == self->player &&
            data_ov002_022cd3f4.f1c == self->idx)
            func_ov002_021de4b0((int)self, data_ov002_022cd3f4.f4, data_ov002_022cd3f4.f20);
        else
            func_ov002_021de4b0((int)self, data_ov002_022cd3f4.f0, data_ov002_022cd3f4.f1c);
        return 0;
    }
    if (state == 0x7f) {
        func_ov002_0226b22c(self->player, self->idx, 1,
                            *(int *)((char *)data_ov002_022d016c + 0xd44));
        return 0x7e;
    }
    if (state != 0x80) return 0;
    if (data_ov002_022cd744[self->player] == 1)
        *(int *)((char *)data_ov002_022d016c + 0xd44) = func_ov002_021b00d0(2);
    else
        func_ov002_021ae664(0x38);
    return 0x7f;
}
