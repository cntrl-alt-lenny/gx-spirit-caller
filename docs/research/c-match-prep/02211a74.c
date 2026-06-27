/* CAMPAIGN-PREP candidate for func_02211a74 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     f2 bit0/fld5 bitfields; (bit0&1) forces and; asymmetric (w4<<17)>>23 raw; slot sub-field recombine; 5-arg d59cc
 *   risk:       Compile-verified: body math matches but (a) mwcc swaps self->ip/bit0->r0 vs orig self r0/bit0 ip (permuter); (b) orig PREDICATE-loads extra only if id==0x19a5 (ldreqh) — my unconditional (u16)f8 cannot reproduce; slot fields struct-guessed.
 *   confidence: low
 */
typedef unsigned short u16;
struct F02211a74_F2 { u16 bit0 : 1; u16 fld5 : 5; u16 rest : 10; };
struct F02211a74_Self { u16 id; struct F02211a74_F2 f2; u16 w4; u16 pad6; u16 f8; };
struct F02211a74_Slot { unsigned int id : 13; unsigned int b13 : 1; unsigned int mid : 8; unsigned int f22 : 8; unsigned int top2 : 2; };
extern char data_ov002_022cf16c[];
extern char data_ov002_022cf1a4[];
extern int  func_ov002_021d59cc(unsigned int bit, unsigned int fld, int tag, int mode, int extra);
int func_ov002_02211a74(struct F02211a74_Self *self) {
    unsigned int bit0 = self->f2.bit0;
    unsigned int fld5 = self->f2.fld5;
    int field = ((unsigned int)(self->w4 << 17)) >> 23;
    struct F02211a74_Slot *slot =
        (struct F02211a74_Slot *)(data_ov002_022cf16c + (bit0 & 1) * 0x868 +
                                  0x30 + fld5 * 0x14);
    if (field != slot->f22 * 2 + slot->b13)
        return 0;
    if (*(u16 *)(data_ov002_022cf1a4 + (bit0 & 1) * 0x868 + fld5 * 0x14) == 0)
        return 0;
    func_ov002_021d59cc(bit0, fld5, self->id, 2, (u16)self->f8);
    return 0;
}
