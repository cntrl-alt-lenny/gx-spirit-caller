/* func_0206ccbc: critsec — disable, conditional dispatch, restore (sp2p3 .legacy.c).
 *
 *     push  {r4, r5, r6, lr}
 *     ldr   r6, [r0, #0x64]
 *     bl    OS_DisableIrq
 *     ldr   r4, [r6, #0xf8]
 *     mov   r5, r0
 *     cmp   r4, #0x0
 *     beq   .L_0206cce8
 *     mov   r1, #0x0
 *     mov   r0, r4
 *     str   r1, [r6, #0xf8]
 *     bl    func_0207092c
 * .L_0206cce8:
 *     mov   r0, r5
 *     bl    OS_RestoreIrq
 *     mov   r0, r4
 *     pop   {r4, r5, r6, lr}
 *     bx    lr
 */

typedef struct inner_0206ccbc {
    char    _pad[0xf8];
    void   *f8;          /* +0xf8 */
} inner_0206ccbc_t;

typedef struct {
    char                _pad[0x64];
    inner_0206ccbc_t   *f64;       /* +0x64 */
} arg_0206ccbc_t;

extern int  OS_DisableIrq(void);
extern void OS_RestoreIrq(int saved);
extern void func_0207092c(void *p);

void *func_0206ccbc(arg_0206ccbc_t *arg) {
    inner_0206ccbc_t *p = arg->f64;
    int saved = OS_DisableIrq();
    void *r = p->f8;
    if (r != 0) {
        p->f8 = 0;
        func_0207092c(r);
    }
    OS_RestoreIrq(saved);
    return r;
}
