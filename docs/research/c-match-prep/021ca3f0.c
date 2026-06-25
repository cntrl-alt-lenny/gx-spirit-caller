/* CAMPAIGN-PREP candidate for func_021ca3f0 (ov002, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     GUARD then tail bool; nested-call args; bind both args to r4/r5
 *   risk:       arg1 held in r4 across both halves; if mwcc reorders the two b878/b890 evaluations the arg setup flips
 *   confidence: med
 */
/* func_ov002_021ca3f0: two-stage AND wrapper. First gate 021ca2c8(arg0,
 * b878(arg1)) must be nonzero, else 0; result is 021ca2d0(arg0, b890(arg1))
 * normalised to 0/1. arg0=r5, arg1=r4. */
extern unsigned int func_0202b878(int id);
extern unsigned int func_0202b890(int id);
extern int func_ov002_021ca2c8(int a, int b);
extern int func_ov002_021ca2d0(int a, int b);

int func_ov002_021ca3f0(int arg0, int arg1) {
    if (func_ov002_021ca2c8(arg0, func_0202b878(arg1)) == 0) return 0;
    return func_ov002_021ca2d0(arg0, func_0202b890(arg1)) != 0;
}
