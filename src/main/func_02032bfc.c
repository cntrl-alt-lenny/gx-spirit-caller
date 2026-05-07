/* func_02032bfc: stack-arg dispatcher via r1 — `(arg1)->fn_ef0()` if non-null.
 *
 *     stmdb sp!, {r3, lr}
 *     ldr r1, [r1, #0xef0]
 *     cmp r1, #0x0
 *     ldmeqia sp!, {r3, pc}
 *     blx r1
 *     ldmia sp!, {r3, pc}
 *
 * Sibling of func_02032a00 — different fn-ptr offset, different
 * caller-arg position used to index.
 */

typedef void (*fn4_self_t)(int a, void *self, int c, int d);

typedef struct {
    char        _pad[0xef0];
    fn4_self_t  fn_ef0;
} ctx_ef0_t;

void func_02032bfc(int a, ctx_ef0_t *ctx, int c, int d) {
    fn4_self_t f = ctx->fn_ef0;
    if (f != 0) f(a, (void *)f, c, d);
}
