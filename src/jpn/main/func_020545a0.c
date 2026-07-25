/* CAMPAIGN-PREP candidate for func_020545a0 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     double null-test (assert then return-0) + accumulate loop
 *   risk:       scheduling: total=0 must hoist above assert to feed mov r2,r4; else r2,#0 emitted instead
 *   confidence: med
 */
/* func_020545a0: NULL-assert (warns, falls through), then a SECOND
 * null-check returning 0; accumulate func_020540cc(items[i]) over the
 * array. total=0 is hoisted above the assert and reused as its r2=0
 * literal (mov r2,r4). items at +0, count at +0x4. */

extern char data_020ffaac[];   /* -> r0 */
extern char data_020ffaa0[];   /* -> r1 */
extern void func_020a6c60(char *file, char *expr, int zero, int line);
extern int  func_020540cc(void *item);

typedef struct {
    void **items;   /* +0x00 */
    int    count;   /* +0x04 */
} List02054614;

int func_020545a0(List02054614 *p) {
    int total = 0;
    int i;

    if (p == 0) func_020a6c60(data_020ffaac, data_020ffaa0, 0, 0x61);
    if (p == 0) return 0;

    for (i = 0; i < p->count; i++)
        total += func_020540cc(p->items[i]);

    return total;
}
