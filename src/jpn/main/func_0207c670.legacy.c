/* func_0207c670: critsec — multi-bail with offset-return (sp2p3 .legacy.c).
 *
 *     push  {r4, r5, lr}
 *     sub   sp, sp, #0x4
 *     mov   r4, r0
 *     bl    OS_DisableIrq
 *     mov   r5, r0
 *     bl    func_0207b450
 *     cmp   r0, #0x0
 *     bne   .L_0207c790
 *     mov   r0, r5
 *     bl    OS_RestoreIrq
 *     add   sp, sp, #0x4
 *     mov   r0, #0x0
 *     pop   {r4, r5, lr}
 *     bx    lr
 * .L_0207c790:
 *     mov   r0, r4
 *     bl    func_0207c39c
 *     movs  r4, r0
 *     bne   .L_0207c7b8
 *     mov   r0, r5
 *     bl    OS_RestoreIrq
 *     add   sp, sp, #0x4
 *     mov   r0, #0x0
 *     pop   {r4, r5, lr}
 *     bx    lr
 * .L_0207c7b8:
 *     mov   r0, r5
 *     bl    OS_RestoreIrq
 *     add   r0, r4, #0x10
 *     add   sp, sp, #0x4
 *     pop   {r4, r5, lr}
 *     bx    lr
 */

extern int  OS_DisableIrq(void);
extern void OS_RestoreIrq(int saved);
extern void *func_0207b450(void);
extern void *func_0207c39c(void *arg);

void *func_0207c670(void *arg) {
    int saved = OS_DisableIrq();
    if (func_0207b450() == 0) {
        OS_RestoreIrq(saved);
        return 0;
    }
    {
        void *r = func_0207c39c(arg);
        if (r == 0) {
            OS_RestoreIrq(saved);
            return 0;
        }
        OS_RestoreIrq(saved);
        return (char *)r + 0x10;
    }
}
