/* CAMPAIGN-PREP candidate for func_02018b14 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     tiny leaf returning a boolean condition (short-circuit ||) consumed in flags
 *   risk:       asm returns 1 with a DEAD trailing `cmp r1,#7` (no cond-move consumes it) — needs a flag/condition-return form mwcc won't emit from a plain int return
 *   confidence: low
 */
/* func_02018b14: 2-arg predicate. asm: cmp r0,#2; mov r0,#1; bxne lr;
 * cmp r1,#7; bx lr. If a!=2 returns 1; if a==2 the second compare sets flags
 * but r0 stays 1, i.e. the result is the boolean (a!=2 || b==7) left partly in
 * the condition flags. mwcc would normally materialize b==7 into r0 with
 * moveq/movne; the baserom's bare `cmp;bx lr` is a condition-return shape that
 * resists a plain `int` return. Candidate is the natural source. */
int func_02018b14(int a, int b) {
    return a != 2 || b == 7;
}
