/* func_02034754: irq-disable + helper + irq-restore.
 *
 *     push {r4, r5, r6, lr}
 *     mov r6, r0; mov r5, r1
 *     bl OS_DisableIrq; mov r4, r0
 *     mov r0, r6; mov r2, r5; mov r1, #0
 *     bl func_020945f4(self, 0, n)
 *     mov r0, r4; bl OS_RestoreIrq; pop
 */
extern int OS_DisableIrq(void);
extern void OS_RestoreIrq(int saved);
extern void func_020945f4(void *p, int z, int n);

void func_02034754(void *self, int n) {
    int saved = OS_DisableIrq();
    func_020945f4(self, 0, n);
    OS_RestoreIrq(saved);
}
