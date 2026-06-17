/* func_02041420: optional dispatch through deep-struct field + cleanup call.
 * Pool entry holds a single global arg passed to the callback.
 *
 *     push  {r4, lr}
 *     mov   r4, r1
 *     ldr   r1, [r4, #0x0]        ; r1 = *p (saved val)
 *     add   r0, r0, #0x1000       ; r0 = ctx + 0x1000 (offset split)
 *     cmp   r1, #0x0
 *     ldr   r3, [r0, #0x14]       ; r3 = ctx->fn (speculative)
 *     beq   .L_02041498
 *     ldr   r0, .L_020414ac       ; r0 = &data_020fe7e0
 *     mov   r2, #0x0
 *     blx   r3                    ; fn(&data_020fe7e0, *p, 0)
 * .L_02041498:
 *     mov   r0, r4
 *     mov   r1, #0x0
 *     mov   r2, #0x10
 *     bl    func_02094500         ; func_02094500(p, 0, 0x10)
 *     pop   {r4, pc}
 * .L_020414ac: .word data_020fe7e0
 */

typedef void (*fn_02041470_t)(void *a, int v, int z);
typedef struct {
    char            _pad[0x1014];
    fn_02041470_t   fn;          /* +0x1014 */
} ctx_02041470_t;

extern void *data_020fe7e0;
extern void func_02094500(void *p, int b, int c);

void func_02041420(ctx_02041470_t *ctx, int *p) {
    int v = *p;
    fn_02041470_t fn = ctx->fn;
    if (v != 0) {
        fn(&data_020fe7e0, v, 0);
    }
    func_02094500(p, 0, 0x10);
}
