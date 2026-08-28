/* func_02089b8c: no-op if param1==0. Otherwise, under an IRQ-disabled
 * critical section, run func_02089318(param1), and if param0 matches
 * func_02088f3c(param2) also fire func_02088f20(param2, 0); finally
 * re-run func_02089318() on the first call's own result before
 * restoring interrupts. */

extern int OS_DisableIrq(void);
extern void OS_RestoreIrq(int state);
extern int func_02088f20(int a, int b);
extern int func_02088f3c(int a);
extern int func_02089318(int a);

void func_02089b8c(int param0, int param1, int param2)
{
    int r;
    int irq_state;

    if (param1 == 0)
        return;

    irq_state = OS_DisableIrq();
    r = func_02089318(param1);

    if (param0 == func_02088f3c(param2))
        func_02088f20(param2, 0);

    func_02089318(r);
    OS_RestoreIrq(irq_state);
}
