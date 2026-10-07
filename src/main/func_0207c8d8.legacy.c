/* func_0207c8d8: with interrupts off, clear the table at data_021a088c +
 * 0x2270 (size at +0x2274) when present. */
typedef struct {
    unsigned char _pad_00[0x2270];
    void *table;
    int size;
} Block;
extern int OS_DisableIrq(void);
extern void OS_RestoreIrq(int mode);
extern Block *func_0207b538(void);
extern void func_020945f4(void *dst, int val, int n);

void func_0207c8d8(void) {
    int irq;
    Block *b;

    irq = OS_DisableIrq();
    b = func_0207b538();
    if (b == 0) {
        OS_RestoreIrq(irq);
        return;
    }
    if (b->table != 0 && b->size > 0) {
        func_020945f4(b->table, 0, b->size);
    }
    OS_RestoreIrq(irq);
}
