/* func_0203cac0: set-bit-and-dispatch (the converse of func_0203ca78).
 * (C-24 family: 3-callee-save sp3 canonical signature.)
 *
 *     push  {r4, r5, lr}
 *     sub   sp, sp, #0x4
 *     mov   r5, r0
 *     mov   r0, #0x1
 *     mov   r4, r1
 *     bl    func_0203c900
 *     ldrb  r1, [r0, #0x8]
 *     ands  r2, r1, r5
 *     addne sp, sp, #0x4
 *     movne r0, #0x0
 *     popne {r4, r5, pc}             ; bit IS set, return 0
 *     orr   r1, r1, r5
 *     strb  r1, [r0, #0x8]
 *     ldr   r2, [r0, #0x0]
 *     mov   r0, r5
 *     mov   r1, r4
 *     blx   r2
 *     add   sp, sp, #0x4
 *     pop   {r4, r5, pc}
 */

typedef int (*fn_0203cac0_t)(int a, int b);
typedef struct {
    fn_0203cac0_t   fn;          /* +0x0 */
    char            _pad[0x4];
    unsigned char   flags;       /* +0x8 */
} ctx_0203cac0_t;

extern ctx_0203cac0_t *func_0203c900(int x);

int func_0203cac0(int mask, int arg1) {
    ctx_0203cac0_t *ctx = func_0203c900(1);
    if (ctx->flags & mask) return 0;
    ctx->flags |= mask;
    return ctx->fn(mask, arg1);
}
