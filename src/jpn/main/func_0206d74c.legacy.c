extern int OS_DisableIrq(void);
extern void OS_RestoreIrq(int saved);
extern int func_0206d728(void *a0);
extern void func_020919a4(void *p);

int func_0206d74c(void *a0, int a1, int a2, int *a3, int a4) {
    int limit = a2;
    char *base;
    int result;
    int irq;
    int keepGoing;

    base = *(char **)((char *)a0 + 0x68);
    if (limit > a1) {
        limit = a1;
    }
    irq = OS_DisableIrq();
    keepGoing = a4 & 1;

    for (;;) {
        result = func_0206d728(a0);
        if (result >= limit) {
            *a3 = *(unsigned short *)(base + 0x100);
            if (result >= a1) {
                result = a1;
            }
            break;
        }
        if (!keepGoing) {
            result = 0;
            break;
        }
        func_020919a4(base + 0x104);
    }

    OS_RestoreIrq(irq);
    return result;
}
