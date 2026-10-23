/* The IRQ primitive returns the previous CPSR mask in r0. */
extern int OS_DisableIrq(void);
extern void OS_RestoreIrq(int unused0);
extern void func_02091a8c(void *q);
extern unsigned char data_027e0000[];
extern unsigned char OSi_IrqCheckBuf[];
void func_020903d4(int clear, unsigned int mask) {
    int saved = OS_DisableIrq();
    if (clear) {
        *(unsigned int *)((unsigned int)data_027e0000 + 0x3ff8) &= ~mask;
    }
    OS_RestoreIrq(saved);
    while (!(mask & *(unsigned int *)((unsigned int)data_027e0000 + 0x3ff8))) {
        func_02091a8c(OSi_IrqCheckBuf);
    }
}
