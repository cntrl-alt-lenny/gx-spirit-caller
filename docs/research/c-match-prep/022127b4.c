/* CAMPAIGN-PREP candidate for func_022127b4 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     f4.b2 (word4<<29)>>31 :1 guard; f2 bit0:1+f5:5 bitfields; state dispatch; d016c[0xd44] shuttle; 5-arg d59cc
 *   risk:       Compile-verified BYTE-IDENTICAL across all three arms + guard (incl. ip-held bit0 in 0x7f arm). No expected divergence.
 *   confidence: high
 */
typedef unsigned short u16;
struct F022127b4_F2 { u16 bit0 : 1; u16 f5 : 5; u16 rest : 10; };
struct F022127b4_F4 { u16 lo : 2; u16 b2 : 1; u16 hi : 13; };
struct F022127b4_Self { u16 id; struct F022127b4_F2 f2; struct F022127b4_F4 f4; };
extern char data_ov002_022cd744[];
extern char data_ov002_022ce288[];
extern char data_ov002_022d016c[];
extern char data_ov002_022d0e6c[];
extern int  func_ov002_021ae664(int a);
extern int  func_ov002_021b00d0(int a);
extern int  func_ov002_021d59cc(unsigned int bit, unsigned int fld, int tag, int mode, int extra);
extern int  func_ov002_0226b22c(unsigned int bit, unsigned int fld, int c, int d);
int func_ov002_022127b4(struct F022127b4_Self *self) {
    int state;
    if (self->f4.b2)
        return 0;
    state = *(int *)(data_ov002_022ce288 + 0x5a8);
    if (state == 0x7e) {
        func_ov002_021d59cc(self->f2.bit0, self->f2.f5, self->id, 2,
                            *(u16 *)(data_ov002_022d0e6c + 0xb2));
        return 0xa;
    }
    if (state == 0x7f) {
        func_ov002_0226b22c(self->f2.bit0, self->f2.f5, 1,
                            *(int *)(data_ov002_022d016c + 0xd44));
        return 0x7e;
    }
    if (state == 0x80) {
        if (*(int *)(data_ov002_022cd744 + self->f2.bit0 * 4) == 1) {
            *(int *)(data_ov002_022d016c + 0xd44) = func_ov002_021b00d0(2);
        } else {
            func_ov002_021ae664(0x38);
        }
        return 0x7f;
    }
    return 0;
}
