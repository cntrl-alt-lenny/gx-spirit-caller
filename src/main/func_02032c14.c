/* func_02032c14: stack-arg dispatcher via r2 — `(arg2)->fn_ef4()` if non-null.
 * Sibling of func_02032bfc with the ctx pointer in r2.
 */

typedef void (*fn4_self_t)(int a, int b, void *self, int d);

typedef struct {
    char        _pad[0xef4];
    fn4_self_t  fn_ef4;
} ctx_ef4_t;

void func_02032c14(int a, int b, ctx_ef4_t *ctx, int d) {
    fn4_self_t f = ctx->fn_ef4;
    if (f != 0) f(a, b, (void *)f, d);
}
