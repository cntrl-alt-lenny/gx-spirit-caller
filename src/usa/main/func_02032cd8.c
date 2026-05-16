/* func_02032cd8: helper-then-dispatch via field 0xf10 (sp1p5 default).
 *
 *     push  {r3, r4, r5, lr}
 *     mov   r5, r0
 *     mov   r4, r1
 *     bl    func_02032638
 *     ldr   r2, [r0, #0xf10]      ; r2 = ctx->fn
 *     cmp   r2, #0x0
 *     popeq {r3, r4, r5, pc}
 *     mov   r0, r5
 *     mov   r1, r4
 *     blx   r2                    ; fn(arg0, arg1)
 *     pop   {r3, r4, r5, pc}
 */

typedef void (*fn_02032d2c_t)(void *a, void *b);

typedef struct {
    char            _pad[0xf10];
    fn_02032d2c_t   fn;          /* +0xf10 */
} ctx_02032d2c_t;

extern ctx_02032d2c_t *func_02032638(void);

void func_02032cd8(void *a, void *b) {
    ctx_02032d2c_t *ctx = func_02032638();
    if (ctx->fn == 0) return;
    ctx->fn(a, b);
}
