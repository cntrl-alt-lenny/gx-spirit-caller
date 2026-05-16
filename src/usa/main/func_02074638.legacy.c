/* func_02074638: clear flag + optional dispatch + clear pointer (sp2p3).
 *
 *     push  {r4, lr}
 *     ldr   r4, [r0, #0xc]        ; r4 = arg->p
 *     mov   r0, #0x0
 *     strb  r0, [r4, #0x455]      ; p->flag = 0
 *     ldr   r0, [r4, #0x824]      ; r0 = p->q
 *     cmp   r0, #0x0
 *     beq   .L_02074748
 *     ldr   r1, .L_02074758       ; r1 = &data_0219ee2c
 *     ldr   r1, [r1, #0x0]        ; r1 = data_0219ee2c (fn)
 *     blx   r1                    ; fn(q)
 * .L_02074748:
 *     mov   r0, #0x0
 *     str   r0, [r4, #0x824]      ; p->q = 0
 *     pop   {r4, lr}
 *     bx    lr
 * .L_02074758: .word data_0219ee2c
 */

typedef void (*fn_02074720_t)(void *q);

typedef struct {
    char            _pad0[0x455];
    unsigned char   flag;        /* +0x455 */
    char            _pad1[0x3ce];
    void           *q;           /* +0x824 */
} inner_02074720_t;

typedef struct {
    char                _pad[0xc];
    inner_02074720_t   *p;       /* +0xc */
} arg_02074720_t;

extern fn_02074720_t data_0219ee2c;

void func_02074638(arg_02074720_t *arg) {
    inner_02074720_t *p = arg->p;
    p->flag = 0;
    if (p->q != 0) {
        data_0219ee2c(p->q);
    }
    p->q = 0;
}
