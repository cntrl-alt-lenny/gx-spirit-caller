/* CAMPAIGN-PREP candidate for func_02202154 (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     leaf: bit0 eq-guard, rsb-invert (1-bit0) mul-table index, !=0 result
 *   risk:       orig binds d016c base in r1 across cf8+cec loads; if mwcc reloads, a 2nd ldr literal+ldr diverges. reshape-able (bind base to one local). bxne/bxeq leaf shape should match
 *   confidence: med
 */
/* func_ov002_02202154 (ov002, class C) — batch p_0081. Leaf (bx lr, no frame).
 * global(cf8)==1 ->0; bit0==global(cec) ->0; then table (cf178) indexed by
 * (1-bit0)&1 nonzero -> 1 else 0.
 */
typedef unsigned short u16;
struct Ov002Self { u16 f0; u16 b0 : 1; };

extern char data_ov002_022d016c[];
extern char data_ov002_022cf178[];

int func_ov002_02202154(struct Ov002Self *self) {
    if (*(int *)(data_ov002_022d016c + 0xcf8) != 1) return 0;
    if (*(int *)(data_ov002_022d016c + 0xcec) == self->b0) return 0;
    return *(int *)(data_ov002_022cf178 + ((1 - self->b0) & 1) * 0x868) != 0;
}
