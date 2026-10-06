extern int OS_DisableIrq(void);
extern void OS_RestoreIrq(int state);
extern void func_02091a8c(int v);
int func_02070b4c(int *out, void *arg1)
{
    int value;
    int state;
    state = OS_DisableIrq();
    value = *(int *)((char *)arg1 + 0x44);
    while (value == 0) {
        *(int *)((char *)arg1 + 4) = 3;
        func_02091a8c(0);
        value = *(int *)((char *)arg1 + 0x44);
    }
    OS_RestoreIrq(state);
    *out = value;
    return *(int *)((char *)arg1 + 0x40);
}
