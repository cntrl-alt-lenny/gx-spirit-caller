/* func_0203ca78: gated dispatch — bit-test/clear in ctx->flags then callback.
 * (C-24 family: preserve-3-args + helper + masked-flag-dispatch.)
 *
 *     push  {r4, r5, r6, lr}
 *     mov   r6, r0
 *     mov   r0, #0x1
 *     mov   r5, r1
 *     mov   r4, r2
 *     bl    func_0203c900
 *     ldrb  r2, [r0, #0x8]
 *     ands  r1, r2, r6
 *     popeq {r4, r5, r6, pc}
 *     mvn   r1, r6
 *     and   r1, r2, r1
 *     strb  r1, [r0, #0x8]
 *     ldr   r3, [r0, #0x4]
 *     mov   r0, r6
 *     mov   r1, r5
 *     mov   r2, r4
 *     blx   r3
 *     pop   {r4, r5, r6, pc}
 */

typedef void (*fn_0203ca78_t)(int a, int b, int c);
typedef struct {
    int             _f0;
    fn_0203ca78_t   fn;          /* +0x4 */
    unsigned char   flags;       /* +0x8 */
} ctx_0203ca78_t;

extern ctx_0203ca78_t *func_0203c900(int x);

void func_0203ca78(int mask, int arg1, int arg2) {
    ctx_0203ca78_t *ctx = func_0203c900(1);
    if ((ctx->flags & mask) == 0) return;
    ctx->flags = ctx->flags & ~mask;
    ctx->fn(mask, arg1, arg2);
}
