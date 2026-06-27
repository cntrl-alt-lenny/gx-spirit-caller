/* CAMPAIGN-PREP candidate for func_022055fc (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     f2/f14/*ptr bitfields; f14 bound across b9+b19_22; b9-first compare; deref bit13 vs 1-bit0
 *   risk:       permuter-class: already a parked reg-alloc-walled .s (brief 302). Orig saves bit0 in r2 and rotates regs around the b9/bit13 compares (rsb r0,r2,#1); a C reshape unlikely to reproduce the rotation.
 *   confidence: low
 */
/* func_ov002_022055fc: cls D — tag6==0x16 gate; deref-and-bitfield predicate.
 * f2 [self,#2]: tag6 bits6-11, bit0. f14 [self,#0x14] 32b: a9 bits0-8, b9 bit9,
 * b19_22 bits19-22. ptr=021b9b64(a9); *ptr: bit13, id13 bits0-12.
 * NOTE: parked .s (reg-alloc-walled, brief 302) — match unlikely first build. */
typedef unsigned short u16;
struct F2_055fc { u16 bit0:1; u16 pad:5; u16 tag6:6; u16 rest:4; };
struct F14_055fc {
    unsigned int a9:9; unsigned int b9:1; unsigned int pad:9;
    unsigned int b19_22:4; unsigned int top:9;
};
struct S055fc { u16 f0; struct F2_055fc f2; u16 pad4[8]; struct F14_055fc f14; };
struct T_055fc { unsigned int id13:13; unsigned int pad:1; unsigned int bit13:1; unsigned int top:17; };
extern int func_0202e234(int id);
extern struct T_055fc *func_ov002_021b9b64(unsigned int a9);
int func_ov002_022055fc(struct S055fc *self) {
    struct T_055fc *t;
    if (self->f2.tag6 != 0x16) return 0;
    t = func_ov002_021b9b64(self->f14.a9);
    if (t == 0) return 0;
    if (self->f14.b9 == self->f2.bit0) return 0;
    if (t->bit13 != (1 - self->f2.bit0)) return 0;
    if (self->f14.b19_22 != 0xe) return 0;
    return func_0202e234(t->id13) != 0;
}
