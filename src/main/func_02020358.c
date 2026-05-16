/* func_02020358: tag-based dispatch (sp1p5 default — natural form).
 *
 *     push  {r3, lr}
 *     ldrh  r1, [r0, #0x2]
 *     cmp   r1, #0x0
 *     cmpne r1, #0xf
 *     beq   .L_02020378
 *     mov   r0, r1
 *     bl    func_0201f19c
 *     pop   {r3, pc}
 * .L_02020378:
 *     ldr   r2, [r0, #0x20]
 *     cmp   r2, #0x0
 *     popeq {r3, pc}
 *     cmp   r1, #0x0
 *     moveq r0, #0x1
 *     movne r0, #0x0
 *     blx   r2
 *     pop   {r3, pc}
 */

typedef void (*fn_02020358_t)(int x);

typedef struct {
    char            _pad0[0x2];
    unsigned short  tag;         /* +0x2 */
    char            _pad1[0x1c];
    fn_02020358_t   fn;          /* +0x20 */
} ctx_02020358_t;

extern void func_0201f19c(unsigned int tag);

void func_02020358(ctx_02020358_t *ctx) {
    unsigned short t = ctx->tag;
    if (t != 0 && t != 0xf) {
        func_0201f19c(t);
        return;
    }
    if (ctx->fn == 0) return;
    ctx->fn(t == 0 ? 1 : 0);
}
