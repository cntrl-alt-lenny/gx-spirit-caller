/* func_02032e38: dispatch with retval + cleanup-on-nonzero (sp1p5 default).
 *
 *     push  {r3, r4, r5, lr}
 *     mov   r5, r1                ; r5 = arg1 (preserve)
 *     ldr   r3, [r0, #0xebc]      ; r3 = ctx->fn
 *     mov   r0, r5                ; r0 = arg1 (1st arg of fn)
 *     mov   r1, r2                ; r1 = arg2 (2nd arg of fn)
 *     blx   r3                    ; r0 = fn(arg1, arg2)
 *     movs  r4, r0                ; r4 = result; set flags
 *     beq   .L_02032e64
 *     mov   r2, r5                ; r2 = arg1
 *     mov   r1, #0x0
 *     bl    func_020945f4         ; func_020945f4(result, 0, arg1)
 * .L_02032e64:
 *     mov   r0, r4
 *     pop   {r3, r4, r5, pc}
 */

typedef void *(*fn_02032e38_t)(void *a, int b);

typedef struct {
    char            _pad[0xebc];
    fn_02032e38_t   fn;          /* +0xebc */
} ctx_02032e38_t;

extern void func_020945f4(void *p, int b, void *c);

void *func_02032e38(ctx_02032e38_t *ctx, void *arg1, int arg2) {
    void *r = ctx->fn(arg1, arg2);
    if (r != 0) {
        func_020945f4(r, 0, arg1);
    }
    return r;
}
