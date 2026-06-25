/* CAMPAIGN-PREP candidate for func_02209728 (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     early-return guard chain; ?2:0 tail; 021ff170 5-arg via stack slot
 *   risk:       reshape-able: the b11_12 guard is movs r0,lsr#0x1e on (h<<18) = bits[13:12]!=0; field boundary struct-guessed. Guard-chain order preserved as sequential ifs so early-returns lay in asm order; n bound in r1 across ff170.
 *   confidence: med
 */
/* func_ov002_02209728: long AND-guard chain then func_ov002_021ff2c8 -> n,
 * func_ov002_021ff170(bit0,n,field9,0,0) gate, then func_ov002_021ff354(self,arg1)
 * ? 2 : 0. Reserves a stack word for the 5th arg (sub sp implicit via {r3..}). */
typedef unsigned short u16;

struct F02209728_F2 { u16 bit0 : 1; u16 pad5 : 5; u16 b6_10 : 5; u16 b11_12 : 2; u16 rest : 3; };
struct F02209728_F4 { u16 pad6 : 6; u16 field9 : 9; u16 top : 1; };
struct F02209728_Self { u16 f0; struct F02209728_F2 f2; struct F02209728_F4 f4; };

extern int func_0202b878(u16 a);
extern int func_0202b8c0(u16 a);
extern int func_ov002_021ff2c8(struct F02209728_Self *self, unsigned int bit0);
extern int func_ov002_021ff170(unsigned int bit0, int n, unsigned int field9, unsigned int z0, unsigned int z1);
extern int func_ov002_021ff354(struct F02209728_Self *self, void *arg1);

int func_ov002_02209728(struct F02209728_Self *self, void *arg1) {
    struct F02209728_Self *other = (struct F02209728_Self *)arg1;
    int n;
    if (arg1 == 0) return 0;
    if (other->f2.b6_10 > 10) return 0;
    if (other->f2.b11_12 != 0) return 0;
    if (other->f2.bit0 != self->f2.bit0) return 0;
    if (func_0202b878(*(u16 *)arg1) != 0x16) return 0;
    if (func_0202b8c0(*(u16 *)arg1) != 0) return 0;
    n = func_ov002_021ff2c8(self, self->f2.bit0);
    if (func_ov002_021ff170(self->f2.bit0, n, self->f4.field9, 0, 0) == 0) return 0;
    return func_ov002_021ff354(self, arg1) ? 2 : 0;
}
