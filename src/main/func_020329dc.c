/* func_020329dc: dispatch-or-default-1 (sp1p5 default).
 *
 *     push  {r3, lr}
 *     ldr   r1, [r1, #0xed8]      ; r1 = ctx->fn
 *     mov   r2, #0x1              ; r2 = 1 (default)
 *     cmp   r1, #0x0
 *     beq   .L_020329f8
 *     blx   r1                    ; r0 = fn(arg0)
 *     mov   r2, r0                ; r2 = fn result
 * .L_020329f8:
 *     mov   r0, r2
 *     pop   {r3, pc}
 */

typedef int (*fn_020329dc_t)(void *arg);

typedef struct {
    char            _pad[0xed8];
    fn_020329dc_t   fn;          /* +0xed8 */
} ctx_020329dc_t;

int func_020329dc(void *arg, ctx_020329dc_t *ctx) {
    fn_020329dc_t fn = ctx->fn;
    int result = 1;
    if (fn != 0) result = fn(arg);
    return result;
}
