/* CAMPAIGN-PREP candidate for func_02203a40 (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     guard chain, self->r5/arg1->r4 held; bit0 reloaded; >1 and >0 value-maps
 *   risk:       Orig reloads self->f2 once and hoists it ABOVE the beq so both tail arms shift the same r0; mwcc usually hoists a common-subexpr above a branch, so this should match. If instead mwcc sinks the f2 read into only one arm, a ldrh moves. reshape-able (both arms reference self->f2.bit0 so the load is shared — already structured that way).
 *   confidence: med
 */
/* func_ov002_02203a40 (cls C): 4-guard chain, two-way tail.
 * if (!func_021ca698(bit0,bit0)) return 0;
 * if (!func_021ff320(self,arg1)) return 0;
 * if (func_021b3ecc(bit0,0xb,0x14a0) != 0) return func_021bbf50(bit0) > 1;
 * return func_022536e8(bit0, self->f0, 0) > 0.
 * self held in r5, arg1 in r4. self->f2 reloaded each bit0 read; the f2 reload
 * before the branch is hoisted (both arms use bit0). Note: 021ca698 gets
 * (bit0,bit0) here (not the 1-bit0 complement other siblings use). */

typedef unsigned short u16;

struct F02203a40_F2 { u16 bit0 : 1; u16 rest : 15; };
struct F02203a40_Self { u16 f0; struct F02203a40_F2 f2; };

extern int func_ov002_021ca698(int bit, int notbit);
extern int func_ov002_021ff320(void *self, int arg);
extern int func_ov002_021b3ecc(int player, int kind, int code);
extern int func_ov002_021bbf50(int bit);
extern int func_ov002_022536e8(unsigned int bit, unsigned int f0, unsigned int z);

int func_ov002_02203a40(struct F02203a40_Self *self, int arg1) {
    if (func_ov002_021ca698(self->f2.bit0, self->f2.bit0) == 0)
        return 0;
    if (func_ov002_021ff320(self, arg1) == 0)
        return 0;
    if (func_ov002_021b3ecc(self->f2.bit0, 0xb, 0x14a0) != 0)
        return func_ov002_021bbf50(self->f2.bit0) > 1;
    return func_ov002_022536e8(self->f2.bit0, self->f0, 0) > 0;
}
