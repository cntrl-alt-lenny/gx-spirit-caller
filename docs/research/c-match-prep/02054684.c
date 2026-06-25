/* CAMPAIGN-PREP candidate for func_02054684 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     double null-test + free-each loop + two tail frees
 *   risk:       loop-count signedness; assert pool order; items load type assumed pointer
 *   confidence: high
 */
/* func_02054684: NULL-assert then null-return(void); loop freeing each
 * entry via func_02054148, then free items array (+0) and free self.
 * items at +0, count at +0x4. */

extern char data_020ffb8c[];   /* -> r0 */
extern char data_020ffb80[];   /* -> r1 */
extern void func_020a6d54(char *file, char *expr, int zero, int line);
extern void func_02054148(void *entry);
extern void func_020453b4(void *p);   /* free-like */

typedef struct {
    void **items;   /* +0x00 */
    int    count;   /* +0x04 */
} List02054684;

void func_02054684(List02054684 *p) {
    int i;

    if (p == 0) func_020a6d54(data_020ffb8c, data_020ffb80, 0, 0x51);
    if (p == 0) return;

    for (i = 0; i < p->count; i++)
        func_02054148(p->items[i]);

    func_020453b4(p->items);
    func_020453b4(p);
}
