extern int OS_DisableIrq(void);
extern void OS_RestoreIrq(int state);
extern int func_02096264(int a, int b, int c);

struct S0209a210 {
    void (*f0)(int, int, int);
    unsigned char pad4[0x34 - 0x4];
    volatile unsigned short f34;
    volatile unsigned short f36;
};
extern struct S0209a210 data_021a82b4;

void func_0209a11c(void) {
    int state = OS_DisableIrq();
    int ok = func_02096264(6, 0x3000000, 0) >= 0;

    if (!ok) {
        OS_RestoreIrq(state);
        data_021a82b4.f34 |= 1;
        if (data_021a82b4.f0 != 0) {
            data_021a82b4.f0(0, 4, 0);
        }
        return;
    }

    data_021a82b4.f36 |= 1;
    data_021a82b4.f34 &= ~1;
    OS_RestoreIrq(state);
}
