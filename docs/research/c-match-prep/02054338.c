/* CAMPAIGN-PREP candidate for func_02054338 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     null-assert + indexed-array loop + early-return nonzero
 *   risk:       loop-count signedness; assert pool-literal order; struct field types assumed word
 *   confidence: high
 */
/* func_02054338: NULL-assert, forward loop over items[]; return the
 * first nonzero result, else 0. items at +0, count at +0x4. */

extern char data_020ffb7c[];   /* -> r0 */
extern char data_020ffb80[];   /* -> r1 */
extern void func_020a6d54(char *file, char *expr, int zero, int line);
extern int  func_02053c34(void *item, int a1, int a2);

typedef struct {
    void **items;   /* +0x00 */
    int    count;   /* +0x04 */
} List02054338;

int func_02054338(List02054338 *p, int a1, int a2) {
    int i;

    if (p == 0) func_020a6d54(data_020ffb7c, data_020ffb80, 0, 0xd3);

    for (i = 0; i < p->count; i++) {
        int r = func_02053c34(p->items[i], a1, a2);
        if (r != 0)
            return r;
    }
    return 0;
}
