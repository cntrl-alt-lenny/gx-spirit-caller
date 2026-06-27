/* CAMPAIGN-PREP candidate for func_021f6544 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     switch ce288+0x5b4, :2 f12 bitfield, natural f_d44 re-read after store
 *   risk:       struct-guessed: verified BYTE-MATCH at ov002 cflags across all paths (f12 :2, cd744[bit0] word-index, f_d44 re-read all emit as orig). Only residual risk is d016c offsets f_d44=0xd44 — confirm vs real struct.
 *   confidence: high
 */
/* func_ov002_021f6544: 3-way state machine on ce288+0x5b4. cls D.
 *   case 0: if (f2.f12==3) d016c.f_d44=1;
 *           else if (02203290()==2) { if (cd744[f2.bit0]==1) d016c.f_d44=0;
 *                                     else 021ae484(0x10e); }
 *           else d016c.f_d44=0; state++; return 0;
 *   case 1: self->f8=d016c.f_d44; if (d016c.f_d44==0) return 1;   // natural re-read
 *           0226ae30(f2.bit0,1,0,1); return 1;
 *   default: return 0; */
typedef unsigned short u16;

extern char data_ov002_022ce288[];   /* state @ +0x5b4 */
extern char data_ov002_022d016c[];   /* f_d44 @ +0xd44 */
extern int  data_ov002_022cd744[];   /* flag table */
extern int  func_ov002_02203290(void);
extern int  func_ov002_021ae484(int a);
extern int  func_ov002_0226ae30(int bit, int a, int b, int c);

struct F021f6544_F2 {
    u16 bit0  : 1;
    u16 mid11 : 11;
    u16 f12   : 2;
    u16 hi2   : 2;
};
struct F021f6544 {
    u16 pad0;
    struct F021f6544_F2 f2;
    u16 pad4;
    u16 pad6;
    u16 f8;
};

int func_ov002_021f6544(struct F021f6544 *self) {
    switch (*(int *)(data_ov002_022ce288 + 0x5b4)) {
    case 0:
        if (self->f2.f12 == 3) {
            *(int *)(data_ov002_022d016c + 0xd44) = 1;
        } else if (func_ov002_02203290() == 2) {
            if (data_ov002_022cd744[self->f2.bit0] == 1)
                *(int *)(data_ov002_022d016c + 0xd44) = 0;
            else
                func_ov002_021ae484(0x10e);
        } else {
            *(int *)(data_ov002_022d016c + 0xd44) = 0;
        }
        *(int *)(data_ov002_022ce288 + 0x5b4) += 1;
        return 0;
    case 1:
        self->f8 = *(int *)(data_ov002_022d016c + 0xd44);
        if (*(int *)(data_ov002_022d016c + 0xd44) == 0) return 1;
        func_ov002_0226ae30(self->f2.bit0, 1, 0, 1);
        return 1;
    default:
        return 0;
    }
}
