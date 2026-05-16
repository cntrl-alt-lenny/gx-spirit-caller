/* func_02031f70: dispatch with struct-field args using LR as temp (sp1p5).
 *
 *     push  {r3, lr}
 *     mov   lr, r0                ; lr = ctx (uses LR as scratch — mwcc 1.2 trick)
 *     ldr   ip, [lr, #0x20]       ; ip = ctx->fn
 *     cmp   ip, #0x0
 *     popeq {r3, pc}
 *     ldrh  r2, [lr, #0xc]        ; r2 = ctx->fc (uint16)
 *     mov   r0, r1                ; r0 = arg1
 *     ldrh  r3, [lr, #0xe]        ; r3 = ctx->fe (uint16)
 *     ldr   r1, [lr, #0x8]        ; r1 = ctx->f8
 *     blx   ip                    ; fn(arg1, f8, fc, fe)
 *     pop   {r3, pc}
 */

typedef void (*fn_02031f70_t)(void *a, void *b, unsigned short c, unsigned short d);

typedef struct {
    char            _pad0[0x8];
    void           *f8;          /* +0x8 */
    unsigned short  fc;          /* +0xc */
    unsigned short  fe;          /* +0xe */
    char            _pad2[0x10]; /* +0x10..+0x1f */
    fn_02031f70_t   fn;          /* +0x20 */
} ctx_02031f70_t;

void func_02031f70(ctx_02031f70_t *ctx, void *arg1) {
    fn_02031f70_t fn = ctx->fn;
    if (fn == 0) return;
    fn(arg1, ctx->f8, ctx->fc, ctx->fe);
}
