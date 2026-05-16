/* func_0207c7d0: critsec — check + flag-set with toggle (sp2p3 .legacy.c).
 *
 *     push  {r4, r5, lr}
 *     sub   sp, sp, #0x4
 *     mov   r5, r0
 *     bl    OS_DisableIrq
 *     mov   r4, r0
 *     bl    func_0207b538
 *     cmp   r0, #0x0
 *     bne   .L_0207c808
 *     mov   r0, r4
 *     bl    OS_RestoreIrq
 *     add   sp, sp, #0x4
 *     mov   r0, #0x0
 *     pop   {r4, r5, lr}
 *     bx    lr
 * .L_0207c808:
 *     cmp   r5, #0x0
 *     beq   .L_0207c834
 *     add   r1, r0, #0x2000
 *     ldrb  r1, [r1, #0x26a]
 *     add   r0, r0, #0x2000
 *     cmp   r1, #0x0
 *     movne r5, #0x1
 *     mov   r1, #0x1
 *     moveq r5, #0x0
 *     strb  r1, [r0, #0x26a]
 *     b     .L_0207c854
 * .L_0207c834:
 *     add   r1, r0, #0x2000
 *     ldrb  r1, [r1, #0x26a]
 *     add   r0, r0, #0x2000
 *     cmp   r1, #0x0
 *     movne r5, #0x1
 *     mov   r1, #0x0
 *     moveq r5, #0x0
 *     strb  r1, [r0, #0x26a]
 * .L_0207c854:
 *     mov   r0, r4
 *     bl    OS_RestoreIrq
 *     mov   r0, r5
 *     add   sp, sp, #0x4
 *     pop   {r4, r5, lr}
 *     bx    lr
 */

typedef struct {
    char            _pad[0x226a];
    unsigned char   flag;        /* +0x226a */
} ctx_0207c7d0_t;

extern int  OS_DisableIrq(void);
extern void OS_RestoreIrq(int saved);
extern ctx_0207c7d0_t *func_0207b538(void);

int func_0207c7d0(int new_val) {
    int saved = OS_DisableIrq();
    ctx_0207c7d0_t *q = func_0207b538();
    int prev;
    if (q == 0) {
        OS_RestoreIrq(saved);
        return 0;
    }
    if (new_val != 0) {
        prev = (q->flag != 0) ? 1 : 0;
        q->flag = 1;
    } else {
        prev = (q->flag != 0) ? 1 : 0;
        q->flag = 0;
    }
    OS_RestoreIrq(saved);
    return prev;
}
