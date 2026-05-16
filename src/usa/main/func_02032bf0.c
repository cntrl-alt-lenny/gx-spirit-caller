/* func_02032bf0: register-at-index-then-dispatch (sp1p5 default).
 *
 *     push  {r3, r4, r5, lr}
 *     mov   r4, r1                ; r4 = idx
 *     mov   r5, r0                ; r5 = arg0
 *     bl    func_02032638         ; r0 = ctx
 *     add   r1, r0, r4, lsl #0x2  ; r1 = ctx + idx*4
 *     str   r5, [r1, #0xf24]      ; ctx[idx*4 + 0xf24] = arg0
 *     ldr   r2, [r0, #0xf04]      ; r2 = ctx->fn
 *     cmp   r2, #0x0
 *     popeq {r3, r4, r5, pc}
 *     mov   r0, r5
 *     mov   r1, r4
 *     blx   r2                    ; fn(arg0, idx)
 *     pop   {r3, r4, r5, pc}
 */

typedef void (*fn_02032c44_t)(void *a, int b);

typedef struct {
    char            _pad0[0xf04];
    fn_02032c44_t   fn;          /* +0xf04 */
    char            _pad1[0x1c];
    void           *array[1];     /* +0xf24 — open-array indexed by idx */
} ctx_02032c44_t;

extern ctx_02032c44_t *func_02032638(void);

void func_02032bf0(void *arg0, int idx) {
    ctx_02032c44_t *ctx = func_02032638();
    ctx->array[idx] = arg0;
    if (ctx->fn == 0) return;
    ctx->fn(arg0, idx);
}
