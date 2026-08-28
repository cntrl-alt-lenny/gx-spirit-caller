/* func_0208ade0: state-machine setter for data_021022e0 (a small struct:
 * int state @+0, function pointer @+4). No-op if arg0 equals the current
 * state; if the OLD state was 1, fire func_02094bf8(0) first. Then
 * disable IRQ, call func_02094398(0, &data_021022f8, 0xc0), store the
 * new state, and dispatch on arg0 (0-3, default) to pick the @+4
 * function pointer, mirroring the jump table's body-address order
 * (case1, case2, case3, case0, default). Restore IRQ; if arg0==1,
 * return func_02094bf8(0x3000)'s result, else return early. */

extern int data_021022e0;
extern char data_021022f8[];
extern int func_02094bf8(int);
extern void func_02094398(int a, void *b, int c);
extern int OS_DisableIrq(void);
extern int OS_RestoreIrq(int);
extern void func_0208aba8(void);
extern void func_0208a9b0(void);
extern void func_0208a968(void);
extern void func_0208ad48(void);

int func_0208ade0(int arg0) {
    int old;
    int irq;

    old = data_021022e0;
    if (arg0 == old)
        return old;

    if (old == 1)
        func_02094bf8(0);

    irq = OS_DisableIrq();
    func_02094398(0, data_021022f8, 0xc0);
    data_021022e0 = arg0;

    switch (arg0) {
    case 1:
        *(void (**)(void))((char *)&data_021022e0 + 4) = func_0208aba8;
        break;
    case 2:
        *(void (**)(void))((char *)&data_021022e0 + 4) = func_0208a9b0;
        break;
    case 3:
        *(void (**)(void))((char *)&data_021022e0 + 4) = func_0208a968;
        break;
    case 0:
        *(void (**)(void))((char *)&data_021022e0 + 4) = func_0208ad48;
        break;
    default:
        *(void (**)(void))((char *)&data_021022e0 + 4) = func_0208ad48;
        break;
    }

    {
        int result = OS_RestoreIrq(irq);
        if (arg0 != 1)
            return result;
    }

    return func_02094bf8(0x3000);
}
