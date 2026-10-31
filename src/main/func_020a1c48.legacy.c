/* The assembly helper returns the saved IRQ mask in r0. */
extern int OS_DisableIrq(void);
extern void OS_RestoreIrq(int irq);
extern int func_020a099c(unsigned int x);
extern char *data_021a98fc;

int func_020a1c48(unsigned int x, unsigned int mode) {
    int value;
    int expected;
    int irq;
    irq = OS_DisableIrq();
    switch (mode) {
    case 0: expected = 10; value = 4; break;
    case 1: expected = 10; value = 3; break;
    case 2: expected = 14; value = 2; break;
    case 3: expected = 7; value = 5; break;
    default:
        OS_RestoreIrq(irq);
        return 0;
    }
    if (data_021a98fc && func_020a099c(x)) {
        unsigned int index = x - 1;
        char *base = data_021a98fc;
        char *row = base + index * 4;
        row += 0x1000;
        if (expected == *(unsigned int *)(row + 0x4e8)) {
            char *out = base + index * 2;
            out += 0x1700;
            *(unsigned short *)(out + 0x54) = value;
            OS_RestoreIrq(irq);
            return 1;
        }
    }
    OS_RestoreIrq(irq);
    return 0;
}





