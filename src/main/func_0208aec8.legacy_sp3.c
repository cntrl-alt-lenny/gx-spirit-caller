/* func_0208aec8: state-machine setter for data_021023c0 (a small struct:
 * int state @+0, function pointer @+4). No-op if arg0 equals the current
 * state; if the OLD state was 1, fire func_02094cec(0) first. Then
 * disable IRQ, call func_0209448c(0, &data_021023d8, 0xc0), store the
 * new state, and dispatch on arg0 (0-3, default) to pick the @+4
 * function pointer, mirroring the jump table's body-address order
 * (case1, case2, case3, case0, default). Restore IRQ; if arg0==1,
 * return func_02094cec(0x3000)'s result, else return early. */

extern int data_021023c0;
extern char data_021023d8[];
extern int func_02094cec(int);
extern void func_0209448c(int a, void *b, int c);
extern int OS_DisableIrq(void);
extern int OS_RestoreIrq(int);
extern void func_0208ac90(void);
extern void func_0208aa98(void);
extern void func_0208aa50(void);
extern void func_0208ae30(void);

int func_0208aec8(int arg0) {
    int old;
    int irq;

    old = data_021023c0;
    if (arg0 == old)
        return old;

    if (old == 1)
        func_02094cec(0);

    irq = OS_DisableIrq();
    func_0209448c(0, data_021023d8, 0xc0);
    data_021023c0 = arg0;

    switch (arg0) {
    case 1:
        *(void (**)(void))((char *)&data_021023c0 + 4) = func_0208ac90;
        break;
    case 2:
        *(void (**)(void))((char *)&data_021023c0 + 4) = func_0208aa98;
        break;
    case 3:
        *(void (**)(void))((char *)&data_021023c0 + 4) = func_0208aa50;
        break;
    case 0:
        *(void (**)(void))((char *)&data_021023c0 + 4) = func_0208ae30;
        break;
    default:
        *(void (**)(void))((char *)&data_021023c0 + 4) = func_0208ae30;
        break;
    }

    {
        int result = OS_RestoreIrq(irq);
        if (arg0 != 1)
            return result;
    }

    return func_02094cec(0x3000);
}
