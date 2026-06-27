/* CAMPAIGN-PREP candidate for func_02214b44 (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     bit2:1 gate; state==0x7f/0x80 dispatch; flag-pack (bit0?0x8000:0)|0x57; asymmetric composite
 *   risk:       reshape-able mostly, but composite ((d<<2>>24)<<1)|((d<<18)>>31) again needs add-with-lsr#31 fusion (permuter-class if it splits). struct-guessed: ce288 is byte[]/int -- the [0x5a8] index and cdc78[0x10] dword offsets.
 *   confidence: low
 */
/* func_ov002_02214b44: gate self->f4 bit2 -> return 0. Read data_022ce288[0x5a8]
 * (int): ==0x7f -> .L_d4 (func_021e2818(bit0); func_021e2b1c(0x1e);
 * func_021e2818(bit0); return 0). ==0x80 -> func_0225368c(bit0, self->f0, 0);
 * if 0: func_021ae400(bit0, 0xd), return 0; else func_021e286c(bit0), then build
 * id=(bit0?0x8000:0)|0x57 and composite from data_022cdc78[0x10], call
 * func_021d479c(id, 0xd, composite); return 0x7f. Else return 0. */

typedef unsigned short u16;

struct Self02214b44 {
    u16 f0;
    u16 bit0 : 1;     /* +2 */
    u16 _f4lo : 2;    /* +4 bits0-1 */
    u16 b2 : 1;       /* +4 bit2 */
};

extern int  data_ov002_022ce288[];
extern unsigned int data_ov002_022cdc78[];
extern int  func_ov002_0225368c(int bit0, int f0, int z);
extern void func_ov002_021ae400(int bit0, int k);
extern void func_ov002_021e286c(int bit0);
extern void func_ov002_021e2818(int bit0);
extern void func_ov002_021e2b1c(int k);
extern int  func_ov002_021d479c(int id, int a, int comp, int d);

int func_ov002_02214b44(struct Self02214b44 *self) {
    int state;
    if (self->b2) return 0;
    state = data_ov002_022ce288[0x5a8 / 4];
    if (state == 0x7f) {
        func_ov002_021e2818(self->bit0);
        func_ov002_021e2b1c(0x1e);
        func_ov002_021e2818(self->bit0);
        return 0;
    }
    if (state == 0x80) {
        int id, comp;
        unsigned int d;
        if (func_ov002_0225368c(self->bit0, self->f0, 0) == 0) {
            func_ov002_021ae400(self->bit0, 0xd);
            return 0;
        }
        func_ov002_021e286c(self->bit0);
        id = ((self->bit0 ? 0x8000 : 0) | 0x57);
        d = data_ov002_022cdc78[0x10 / 4];
        comp = (int)(((d << 2) >> 24) << 1) + (int)((d << 18) >> 31);
        func_ov002_021d479c((u16)id, 0xd, (u16)comp, 0);
        return 0x7f;
    }
    return 0;
}
