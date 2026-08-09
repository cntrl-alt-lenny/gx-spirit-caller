extern void func_020785cc(void *buf);
extern int OS_DisableIrq(void);
extern void OS_RestoreIrq(int saved);
extern void func_0207850c(void *buf, void *src, int n);
extern void func_02078498(void *buf, void *p);

extern char data_021a0708[];
extern char data_021a0700[];

void func_0207576c(void *a0, int a1) {
    char localbuf[0x60];
    int irq;

    func_020785cc(localbuf);
    irq = OS_DisableIrq();

    func_0207850c(localbuf, data_021a0708, 0x14);
    func_0207850c(localbuf, a0, a1);
    func_02078498(localbuf, data_021a0708);

    OS_RestoreIrq(irq);

    data_021a0700[0] = 1;
}
