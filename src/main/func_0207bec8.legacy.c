extern int OS_DisableIrq(void);
extern void OS_RestoreIrq(int saved);
extern void func_0207b038(int a0);
extern int func_0209f0d8(int a0);
extern void func_0207ab68(void);
extern void *data_021a088c;

int func_0207bec8(void) {
    int irq = OS_DisableIrq();
    if (data_021a088c == 0) {
        OS_RestoreIrq(irq);
        return 1;
    }
    switch (*(int *)((char *)data_021a088c + 0x2260)) {
    case 4:
        OS_RestoreIrq(irq);
        return 2;
    case 1:
        OS_RestoreIrq(irq);
        return 0;
    default:
        OS_RestoreIrq(irq);
        return 1;
    case 3:
        switch (func_0209f0d8((int)func_0207ab68)) {
        case 2:
            func_0207b038(4);
            *(unsigned short *)((char *)data_021a088c + 0x2280) = 2;
            break;
        case 8:
            OS_RestoreIrq(irq);
            return 4;
        case 3:
        default:
            func_0207b038(0xb);
            OS_RestoreIrq(irq);
            return 7;
        }
        OS_RestoreIrq(irq);
        return 3;
    }
}
