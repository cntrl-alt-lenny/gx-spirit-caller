/* func_0207c86c: critsec — disable, query, conditional read, restore.
 * Try natural form with single-restore-at-end + goto-skip pattern.
 *
 *     push  {r4, r5, lr}
 *     sub   sp, sp, #0x4
 *     bl    OS_DisableIrq
 *     mov   r5, r0
 *     bl    func_0207b538
 *     cmp   r0, #0x0
 *     mov   r4, #0x0
 *     bne   .L_0207c8a4
 *     mov   r0, r5
 *     bl    OS_RestoreIrq
 *     add   sp, sp, #0x4
 *     mov   r0, r4
 *     pop   {r4, r5, lr}
 *     bx    lr
 * .L_0207c8a4:
 *     add   r0, r0, #0x2000
 *     ldr   r1, [r0, #0x270]
 *     cmp   r1, #0x0
 *     beq   .L_0207c8c0
 *     ldr   r0, [r0, #0x274]
 *     cmp   r0, #0xc
 *     ldrhi r4, [r1, #0x0]
 * .L_0207c8c0:
 *     mov   r0, r5
 *     bl    OS_RestoreIrq
 *     mov   r0, r4
 *     add   sp, sp, #0x4
 *     pop   {r4, r5, lr}
 *     bx    lr
 */

typedef struct {
    char            _pad[0x2270];
    int            *p;           /* +0x2270 */
    unsigned int    count;       /* +0x2274 */
} ctx_0207c86c_t;

extern int  OS_DisableIrq(void);
extern void OS_RestoreIrq(int saved);
extern ctx_0207c86c_t *func_0207b538(void);

int func_0207c86c(void) {
    int saved = OS_DisableIrq();
    ctx_0207c86c_t *q = func_0207b538();
    int result = 0;
    if (q == 0) {
        OS_RestoreIrq(saved);
        return result;
    }
    {
        int *p = q->p;
        if (p != 0 && q->count > 0xc) {
            result = *p;
        }
    }
    OS_RestoreIrq(saved);
    return result;
}
