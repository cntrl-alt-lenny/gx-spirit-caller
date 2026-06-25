/* CAMPAIGN-PREP candidate for func_022027b0 (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     bind cd3f4[0]+bit0 reused across branches; :1/:5 bitfields; ==0xf value-map
 *   risk:       Orig pins cd3f4[0] in lr and self->bit0 in ip across BOTH branch arms (one load each); mwcc may instead reload cd3f4[0]/re-derive bit0 in the second arm, diverging on ldr/lsr placement. permuter-class (cross-branch callee-saved reuse not steerable by C form).
 *   confidence: low
 */
/* func_ov002_022027b0 (cls C): two-endpoint match against a cd3f4 record.
 * self->f2: bit0 + a 5-bit field at bit1. cd3f4 is an int[] with endpoints
 * {[0],[0x1c]} and {[4],[0x20]}. Match one endpoint's {key,field} to self's
 * {bit0,f1}; if so, call func_021c8940 with the OTHER endpoint's pair and
 * return (==0xf). Orig holds cd3f4[0] in lr and self->bit0 in ip across both
 * branches (single load each), reloads the cd3f4 base pointer + self->f2. */

typedef unsigned short u16;

struct F022027b0_F2 { u16 bit0 : 1; u16 f1 : 5; u16 rest : 10; };
struct F022027b0_Self { u16 f0; struct F022027b0_F2 f2; };

extern int data_ov002_022cd3f4[];
extern int func_ov002_021c8940(int a, int b);

int func_ov002_022027b0(struct F022027b0_Self *self) {
    int *c = data_ov002_022cd3f4;
    if (c[0] == self->f2.bit0 && c[7] == self->f2.f1)
        return func_ov002_021c8940(c[1], c[8]) == 0xf;
    if (c[1] == self->f2.bit0 && c[8] == self->f2.f1)
        return func_ov002_021c8940(c[0], c[7]) == 0xf;
    return 0;
}
