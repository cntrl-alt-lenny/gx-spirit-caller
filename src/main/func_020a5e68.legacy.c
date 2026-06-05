/* func_020a5e68: IRQ critical-section tail — run func_0209085c(a0) once if the
 * guard word is clear, then OS_RestoreIrq(a1->f4). STYLE-A epilogue (1.2/sp2p3).
 * (a0 is forwarded to the guarded call; a1 holds the saved-irq record.) */
extern void func_0209085c(int);
extern void OS_RestoreIrq(int);
void func_020a5e68(int a0, int *a1){
    if (*a1 == 0) func_0209085c(a0);
    OS_RestoreIrq(a1[1]);
}
