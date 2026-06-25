/* CAMPAIGN-PREP candidate for func_02054148 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     null-assert guard + count-reload loop + tail frees
 *   risk:       loop-count signedness (blt) and assert pool-literal order; res14 load type assumed pointer
 *   confidence: high
 */
/* func_02054148: NULL-assert, counted clear loop (reloads count each
 * iteration), then free of field +0x14 and free of self. */

extern char data_020ffb04[];   /* assert expr string  -> r1 */
extern char data_020ffb5c[];   /* assert file string   -> r0 */
extern void func_020a6d54(char *file, char *expr, int zero, int line);
extern void func_02054314(void *p, int idx);
extern void func_020453b4(void *p);   /* free-like */

typedef struct {
    int   count;          /* +0x00 */
    char  _pad04[0x10];   /* +0x04 */
    void *res14;          /* +0x14 - freed */
} Obj02054148;

void func_02054148(Obj02054148 *p) {
    int i;

    if (p == 0) func_020a6d54(data_020ffb5c, data_020ffb04, 0, 0x69);

    for (i = 0; i < p->count; i++)
        func_02054314(p, i);

    func_020453b4(p->res14);
    func_020453b4(p);
}
