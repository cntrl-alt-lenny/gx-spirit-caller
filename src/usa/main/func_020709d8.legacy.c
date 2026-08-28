extern int OS_DisableIrq(void);
extern void OS_RestoreIrq(int state);
extern void func_020919a4(int v);
extern void func_020917e8(void);

int func_020709d8(int *out, void *arg1) {
    if (*(int *)((char *)arg1 + 0x44) == 0 && *(unsigned char *)((char *)arg1 + 0x8) == 4) {
        int state = OS_DisableIrq();
        while (*(int *)((char *)arg1 + 0x44) == 0 && *(unsigned char *)((char *)arg1 + 0x8) == 4) {
            *(int *)((char *)arg1 + 4) = 2;
            func_020919a4(0);
        }
        OS_RestoreIrq(state);
    } else {
        func_020917e8();
    }
    *out = *(int *)((char *)arg1 + 0x44);
    if (*out != 0) {
        return *(int *)((char *)arg1 + 0x40);
    }
    return 0;
}
