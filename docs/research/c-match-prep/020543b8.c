/* CAMPAIGN-PREP candidate for func_020543b8 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     null-assert + indexed-array loop (void body, count pre-guard)
 *   risk:       void vs int return (trailing r0 leftover); loop-count signedness; assert pool order
 *   confidence: high
 */
/* func_020543b8: NULL-assert, forward loop over items[] calling a void
 * helper; result discarded. items at +0, count at +0x4. The count<=0
 * pre-guard produces the addle/ldmle early-out. */

extern char data_020ffb7c[];   /* -> r0 */
extern char data_020ffb80[];   /* -> r1 */
extern void func_020a6d54(char *file, char *expr, int zero, int line);
extern void func_02053ca8(void *item, int a1, int a2);

typedef struct {
    void **items;   /* +0x00 */
    int    count;   /* +0x04 */
} List020543b8;

void func_020543b8(List020543b8 *p, int a1, int a2) {
    int i;

    if (p == 0) func_020a6d54(data_020ffb7c, data_020ffb80, 0, 0xb6);

    for (i = 0; i < p->count; i++)
        func_02053ca8(p->items[i], a1, a2);
}
