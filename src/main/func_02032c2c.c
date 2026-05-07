/* func_02032c2c: stack-arg dispatcher via r0 — `(arg0)->fn_efc()` if non-null.
 * Sibling of func_02032bfc with the ctx pointer in r0.
 */

typedef void (*fn4_self_t)(void *self, int b, int c, int d);

typedef struct {
    char        _pad[0xefc];
    fn4_self_t  fn_efc;
} ctx_efc_t;

void func_02032c2c(ctx_efc_t *ctx, int b, int c, int d) {
    fn4_self_t f = ctx->fn_efc;
    if (f != 0) f((void *)f, b, c, d);
}
