extern int OS_DisableIrq(void);
extern void OS_RestoreIrq(int state);
extern int func_02096358(int a, int b, int c);

struct State {
    void (*callback)(int, int, int);
    unsigned char pad4[0x30];
    unsigned short flags;
    unsigned short active;
};
extern struct State data_021a8394;

void func_0209a000(void) {
    int state = OS_DisableIrq();
    int ok = func_02096358(6, 0x03000200, 0) >= 0;
    if (!ok) {
        OS_RestoreIrq(state);
        data_021a8394.flags |= 4;
        if (data_021a8394.callback != 0)
            data_021a8394.callback(2, 4, 0);
        return;
    }
    data_021a8394.active |= 4;
    ((unsigned short *)&data_021a8394)[26] &= ~4;
    OS_RestoreIrq(state);
}
