/* CAMPAIGN-PREP candidate for func_0228635c (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     compare-tree => switch on code; per-leaf normalise (>0 / <0 / <3 -> 0/1)
 *   risk:       permuter-class: the orig is a hand-balanced if/cmp tree keyed off ldr'd literals (0x11c3 etc) with sub r1,#imm reuse; mwcc's switch will emit its own comparison order/jump structure, so even semantically-correct it will not reproduce the exact bgt/bge/sub-r1 instruction stream — likely ships as .s.
 *   confidence: low
 */
/* func_ov002_0228635c (ov002, class C) — guard calls then compare/branch dispatch tree.
 * Two early guards, then dispatch on event code r4 against a binary search of magic codes,
 * each leaf calling a different predicate and normalising its result to 0/1. */
extern char data_ov002_022cf178[];
extern int  func_ov002_021bbf50(int arg);
extern int  func_ov002_021bd364(int a, int kind);
extern int  func_ov002_021c9c94(int a);
extern int  func_ov002_0227d27c(int code);
extern int  func_ov002_02280980(int a);

int func_ov002_0228635c(int a, int code) {
    if (func_ov002_0227d27c(code) != 0) return 1;
    if (func_ov002_021c9c94(a) == 0) return 0;
    switch (code) {
    case 0x100c:
        return func_ov002_021bd364(a, 0x17) > 0;
    case 0x11c3 - 0x71:               /* 0x1152 */
        return func_ov002_021bd364(a, 0x16) > 0;
    case 0x11c3 - 0x28:               /* 0x119b */
    case 0x11c3:
        return func_ov002_021bbf50(1 - a) > 0;
    case 0x11c3 - 0x1:                /* 0x11c2 */
    case 0x1331 - 0x13c:              /* 0x11f5 */
        return *(unsigned int *)(data_ov002_022cf178 + (a & 1) * 0x868) < 3;
    case 0x1331:
    case 0x1331 + 0x38:               /* 0x1369 */
        return func_ov002_02280980(a) < 0;
    default:
        return 0;
    }
}
