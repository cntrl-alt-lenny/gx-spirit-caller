/* func_02032cfc: helper-then-helper-then-dispatch (sp1p5 default).
 *
 *     push  {r3, r4, r5, lr}
 *     mov   r5, r0                ; r5 = arg0
 *     bl    func_0203268c         ; r0 = ctx
 *     mov   r4, r0                ; r4 = ctx
 *     mov   r1, r5                ; r1 = arg0
 *     bl    func_020338a8         ; func_020338a8(ctx, arg0)? no — ctx is r0
 *     ldr   r1, [r4, #0xf0c]      ; r1 = ctx->fn
 *     cmp   r1, #0x0
 *     popeq {r3, r4, r5, pc}
 *     mov   r0, r5                ; r0 = arg0
 *     blx   r1                    ; fn(arg0)
 *     pop   {r3, r4, r5, pc}
 */

typedef void (*fn_02032cfc_t)(void *a);

typedef struct {
    char            _pad[0xf0c];
    fn_02032cfc_t   fn;          /* +0xf0c */
} ctx_02032cfc_t;

extern ctx_02032cfc_t *func_0203268c(void);
extern void func_020338a8(ctx_02032cfc_t *ctx, void *a);

void func_02032cfc(void *arg0) {
    ctx_02032cfc_t *ctx = func_0203268c();
    func_020338a8(ctx, arg0);
    if (ctx->fn == 0) return;
    ctx->fn(arg0);
}
