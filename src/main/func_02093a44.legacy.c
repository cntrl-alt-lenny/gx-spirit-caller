extern int OS_DisableIrq(void);
extern void OS_RestoreIrq(int);
extern unsigned int func_02093a3c(unsigned int);
extern unsigned int data_021a66f8;
extern unsigned short data_021a66fc[];
void func_02093a44(unsigned int mask, unsigned int owner) {
    unsigned int active;
    int saved;
    saved = OS_DisableIrq();
    active = mask & data_021a66f8 & 0x1ff;
    for (;;) {
        int index = 31 - func_02093a3c(active);
        unsigned int inverse;
        if (index < 0) break;
        inverse = ~(1U << index);
        active &= inverse;
        if (owner == data_021a66fc[index]) {
            data_021a66fc[index] = 0;
            data_021a66f8 &= inverse;
        }
    }
    OS_RestoreIrq(saved);
}
