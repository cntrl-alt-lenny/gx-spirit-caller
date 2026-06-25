/* CAMPAIGN-PREP candidate for func_0228bbf8 (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     Class C: guard chain; two 02280a1c out-param calls sharing scratch; tail a>=b
 *   risk:       3 stack ints: orig out1@sp8 out2@sp4 scratch@sp0; local-slot order must match or &local args swap. reshape-able: reorder a/b/scratch decls; else permuter-class.
 *   confidence: low
 */
/* CAMPAIGN-PREP candidate for func_ov002_0228bbf8 (ov002, class C, MED tier) — brief 0113.
 * UNVERIFIED + ITERATION-EXPECTED.
 *   recipe:     Class C: guard chain (02286978, 021bbf50 on 1-b0); two out-param calls 02280a1c sharing a scratch slot; tail a>=b
 *   risk:       three stack ints — orig lays out1@sp+8, out2@sp+4, scratch@sp+0; mwcc local-slot assignment order must match or the &local args swap. reshape-able: reorder local decls (a,b,scratch) until slots line up; else permuter-class.
 *   confidence: low
 */
typedef unsigned short u16;
struct Card { u16 f0; u16 b0 : 1; u16 : 15; };

extern int func_ov002_02286978(struct Card *self);
extern int func_ov002_021bbf50(int v);
extern void func_ov002_02280a1c(int v, int *out, int *scratch, int flag);

int func_ov002_0228bbf8(struct Card *self) {
    int a, b, scratch;
    if (func_ov002_02286978(self) == 0) return 0;
    if (func_ov002_021bbf50(1 - self->b0) == 0) return 0;
    func_ov002_02280a1c(1 - self->b0, &a, &scratch, 1);
    func_ov002_02280a1c(self->b0, &b, &scratch, 1);
    return a >= b;
}
