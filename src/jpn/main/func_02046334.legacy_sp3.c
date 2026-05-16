/* func_02046334: prerequisite-call + dispatch struct fn pointer
 * (C-24 recipe: pool-dedup of single global, 2 references).
 *
 *     push  {r4, r5, lr}
 *     sub   sp, sp, #0x4
 *     ldr   r2, .L_02046428       ; r2 = &data_0219da0c (pool slot)
 *     mov   r5, r0
 *     ldr   r0, [r2, #0x0]        ; r0 = *data_0219da0c (ctx)
 *     mov   r4, r1
 *     ldr   r0, [r0, #0x28]       ; r0 = ctx->state
 *     cmp   r0, #0x4
 *     beq   .L_02046404
 *     bl    func_0204664c
 * .L_02046404:
 *     ldr   r1, .L_02046428       ; r1 = &data_0219da0c (SAME slot — dedup)
 *     mov   r0, r5
 *     ldr   r3, [r1, #0x0]        ; r3 = *data_0219da0c (ctx)
 *     mov   r1, r4
 *     ldr   r2, [r3, #0x7c]       ; r2 = ctx->arg2
 *     ldr   r3, [r3, #0x78]       ; r3 = ctx->fn
 *     blx   r3                    ; fn(arg0, arg1, arg2)
 *     add   sp, sp, #0x4
 *     pop   {r4, r5, pc}
 * .L_02046428: .word data_0219da0c
 */

typedef void (*fn_020463dc_t)(void *a, void *b, int c);
typedef struct {
    char            _pad0[0x28];
    int             state;       /* +0x28 */
    char            _pad1[0x4c]; /* 0x2c..0x77 */
    fn_020463dc_t   fn;          /* +0x78 */
    int             arg2;        /* +0x7c */
} ctx_020463dc_t;

extern ctx_020463dc_t *data_0219da0c;
extern void func_0204664c(void);

void func_02046334(void *arg0, void *arg1) {
    if (data_0219da0c->state != 4) func_0204664c();
    data_0219da0c->fn(arg0, arg1, data_0219da0c->arg2);
}
