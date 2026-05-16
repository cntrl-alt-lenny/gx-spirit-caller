/* func_02032c74: preserve-3-args + helper + callback dispatch (C-24 family).
 *
 *     push  {r4, r5, r6, lr}
 *     mov   r6, r0
 *     mov   r5, r1
 *     mov   r4, r2
 *     bl    func_02032638
 *     ldr   r3, [r0, #0xf08]
 *     cmp   r3, #0x0
 *     popeq {r4, r5, r6, pc}
 *     mov   r0, r6
 *     mov   r1, r5
 *     mov   r2, r4
 *     blx   r3
 *     pop   {r4, r5, r6, pc}
 */

typedef void (*fn_02032cc8_t)(void *a, void *b, void *c);
typedef struct {
    char            _pad[0xf08];
    fn_02032cc8_t   fn;          /* +0xf08 */
} ctx_02032cc8_t;

extern ctx_02032cc8_t *func_02032638(void);

void func_02032c74(void *a, void *b, void *c) {
    ctx_02032cc8_t *ctx = func_02032638();
    if (ctx->fn == 0) return;
    ctx->fn(a, b, c);
}
