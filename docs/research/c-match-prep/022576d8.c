/* CAMPAIGN-PREP candidate for func_022576d8 (ov002, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     resolve record; null+field-8 guard; tail-call sink
 *   risk:       CATALOGUED near-miss (core.h brief-356): the field-8 ldr lands r0 vs orig r1 -> 1-insn diff
 *   confidence: low
 */
/* func_ov002_022576d8: resolve a record via func_ov002_02257464(arg0); if it
 * is null or its +8 field is 0, return -1; else tail-call
 * func_ov002_02257750(arg0, record->f8). */
extern char *func_ov002_02257464(int a);
extern int func_ov002_02257750(int a, int b);

int func_ov002_022576d8(int arg0) {
    char *r = func_ov002_02257464(arg0);
    if (r == 0 || *(int *)(r + 8) == 0)
        return -1;
    return func_ov002_02257750(arg0, *(int *)(r + 8));
}
