/* func_0207cbe0: with interrupts off, when state is 9 and f26b clear, return
 * the pointer at block + 0x214c and store halfword 0x2100 + 0x4a in *out. */
typedef struct {
    unsigned char _pad_00[0x2100 + 0x4a];
    unsigned short h214a;
} Dummy;
extern int OS_DisableIrq(void);
extern void OS_RestoreIrq(int mode);
extern unsigned char *func_0207b538(void);

void *func_0207cbe0(unsigned short *out) {
    unsigned char *b;
    void *r = 0;
    unsigned short v = 0;
    int irq;

    b = func_0207b538();
    irq = OS_DisableIrq();
    if (b != 0 && *(int *)(b + 0x2260) == 9) {
        if (b[0x2000 + 0x26b] == 0) {
            r = b + 0x214c;
            v = *(unsigned short *)(b + 0x2100 + 0x4a);
        }
    }
    OS_RestoreIrq(irq);
    if (out != 0) {
        *out = v;
    }
    return r;
}
