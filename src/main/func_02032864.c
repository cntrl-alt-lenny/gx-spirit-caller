/* func_02032864: set-flag-and-dispatch (sp1p5 default).
 *
 *     push  {r3, lr}
 *     ldr   r2, [r1, #0xeb4]
 *     orr   r2, r2, #0x100
 *     str   r2, [r1, #0xeb4]      ; ctx->flags |= 0x100
 *     ldr   r1, [r1, #0xec8]
 *     cmp   r1, #0x0
 *     popeq {r3, pc}
 *     blx   r1                    ; ctx->fn(arg0)
 *     pop   {r3, pc}
 */

typedef void (*fn_02032864_t)(void *arg);

typedef struct {
    char            _pad0[0xeb4];
    unsigned int    flags;       /* +0xeb4 */
    char            _pad1[0x10];
    fn_02032864_t   fn;          /* +0xec8 */
} ctx_02032864_t;

void func_02032864(void *arg, ctx_02032864_t *ctx) {
    ctx->flags |= 0x100;
    if (ctx->fn != 0) ctx->fn(arg);
}
