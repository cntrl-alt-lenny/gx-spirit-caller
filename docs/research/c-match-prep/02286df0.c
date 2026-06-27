/* CAMPAIGN-PREP candidate for func_02286df0 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     bit0 :1; rsb=1-bit0; global+0xcf8==3 branch; movgt/movle => >0
 *   risk:       reshape-able: the load order of self->bit0 vs the d016c phase load may swap (orig loads bit0 first, ldrh before the cmp). If mwcc hoists the global, reorder by reading bit0 into a temp first.
 *   confidence: med
 */
/* func_ov002_02286df0 (cls D): branch on global phase==3, call one of two guards with (1-bit0), bool>0.
 * stmdb {r3,lr} frame; ldrh+lsl#31;lsr#31 => bit0 :1 ; rsb #1 => 1-bit0;
 * cmp r1,#3/bne picks 021bbf50(1-bit0) (phase==3) vs 021bc0d4(1-bit0,1,0) (else). */
typedef unsigned short u16;
struct S86df0 { u16 f0; u16 bit0:1; u16 rest:15; };
extern char data_ov002_022d016c[];
extern int func_ov002_021bbf50(unsigned int v);
extern int func_ov002_021bc0d4(unsigned int v, unsigned int k1, unsigned int z);
int func_ov002_02286df0(struct S86df0 *self) {
    if (*(int *)(data_ov002_022d016c + 0xcf8) == 3)
        return func_ov002_021bbf50(1 - self->bit0) > 0;
    return func_ov002_021bc0d4(1 - self->bit0, 1, 0) > 0;
}
