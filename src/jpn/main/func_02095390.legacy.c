/* func_02095390: critsec — disable, helper(arg1), restore (sp2p3 .legacy.c).
 *
 *     push  {r4, r5, lr}
 *     sub   sp, sp, #0x4
 *     mov   r5, r1
 *     bl    OS_DisableIrq
 *     mov   r4, r0
 *     mov   r0, r5
 *     bl    func_02095a74
 *     mov   r0, r4
 *     bl    OS_RestoreIrq
 *     add   sp, sp, #0x4
 *     pop   {r4, r5, lr}
 *     bx    lr
 */

extern int  OS_DisableIrq(void);
extern void OS_RestoreIrq(int saved);
extern void func_02095a74(void *arg);

void func_02095390(int dummy, void *arg1) {
    int saved = OS_DisableIrq();
    func_02095a74(arg1);
    OS_RestoreIrq(saved);
}
