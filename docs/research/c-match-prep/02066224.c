/* CAMPAIGN-PREP candidate for func_02066224 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     large stack buffer + 6-arg call (2 stacked) + handle store
 *   risk:       v read into r2 after store-0; func_02054ca8 return unused — the ?: hack likely mis-codegens, drop it; buf/v stack order may invert
 *   confidence: low
 */
/* func_02066224: set up a large stack scratch, run two helpers, store a
 * handle. func_02066ea0(&buf, 8, p+0x84, 0); then call
 * func_02054ca8(p->field0, &buf, v, 0, p+0xcc, 8) with two stack args;
 * finally p->field_b0 = func_02055330().
 *
 *   sub sp,#0x810; str 0,[sp,#0x808]            ; v = 0
 *   func_02066ea0(buf, 8, p+0x84, 0)
 *   [sp]=p+0xcc; [sp+4]=8                        ; stack args
 *   func_02054ca8(p->[0], buf, v, 0)
 *   p->[0xb0] = func_02055330()
 */

extern void func_02066ea0(void *buf, int n, void *src, int z);
extern void func_02054ca8(void *ctx, void *buf, int v, int z,
                          void *p2, int n2);
extern int  func_02055330(void);

void func_02066224(char *p) {
    unsigned char buf[0x800];
    int v = 0;

    func_02066ea0(buf, 8, p + 0x84, 0);
    v = func_02054ca8(((void **)p)[0], buf, v, 0,
                      p + 0xcc, 8) ? v : v;   /* see risk */
    *(int *)(p + 0xb0) = func_02055330();
}
