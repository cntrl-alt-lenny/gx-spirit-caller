extern int OS_DisableIrq(void);
extern void OS_RestoreIrq(int state);
extern void func_02091a8c(int v);
extern void func_020918d0(void);

int func_02070ac0(int *out, void *arg1) {
    if (*(int *)((char *)arg1 + 0x44) == 0 && *(unsigned char *)((char *)arg1 + 0x8) == 4) {
        int state = OS_DisableIrq();
        while (*(int *)((char *)arg1 + 0x44) == 0 && *(unsigned char *)((char *)arg1 + 0x8) == 4) {
            *(int *)((char *)arg1 + 4) = 2;
            func_02091a8c(0);
        }
        OS_RestoreIrq(state);
    } else {
        func_020918d0();
    }
    *out = *(int *)((char *)arg1 + 0x44);
    if (*out != 0) {
        return *(int *)((char *)arg1 + 0x40);
    }
    return 0;
}
