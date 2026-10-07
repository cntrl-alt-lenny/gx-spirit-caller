/* func_0207cc50: with interrupts off, when state is 9 and f26b clear, return
 * the pointer at block + 0x2144; else NULL. */
extern int OS_DisableIrq(void);
extern void OS_RestoreIrq(int mode);
extern unsigned char *func_0207b538(void);

void *func_0207cc50(void) {
    unsigned char *b;
    void *r = 0;
    int irq;

    b = func_0207b538();
    irq = OS_DisableIrq();
    if (b != 0 && *(int *)(b + 0x2260) == 9) {
        if (b[0x2000 + 0x26b] == 0) {
            r = b + 0x2144;
        }
    }
    OS_RestoreIrq(irq);
    return r;
}
