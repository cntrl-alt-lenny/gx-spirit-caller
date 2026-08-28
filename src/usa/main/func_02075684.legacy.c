extern void func_020784e4(void *buf);
extern int OS_DisableIrq(void);
extern void OS_RestoreIrq(int saved);
extern void func_02078424(void *buf, void *src, int n);
extern void func_020783b0(void *buf, void *p);

extern char data_021a0628[];
extern char data_021a0620[];

void func_02075684(void *a0, int a1) {
    char localbuf[0x60];
    int irq;

    func_020784e4(localbuf);
    irq = OS_DisableIrq();

    func_02078424(localbuf, data_021a0628, 0x14);
    func_02078424(localbuf, a0, a1);
    func_020783b0(localbuf, data_021a0628);

    OS_RestoreIrq(irq);

    data_021a0620[0] = 1;
}
