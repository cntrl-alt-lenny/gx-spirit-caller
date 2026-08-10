extern int OS_DisableIrq(void);
extern void OS_RestoreIrq(int state);
extern void func_020920bc(void *a0);
extern void func_02091f88(void);
extern char data_021a63d0[];
extern char data_021a63e0[];

int func_0209181c(char *a0, void *a1) {
    char *cur = *(char **)(data_021a63d0 + 0x8);
    char *prev = 0;
    int state = OS_DisableIrq();

    while (cur != 0 && cur != a0) {
        prev = cur;
        cur = *(char **)(cur + 0x68);
    }

    if (cur == 0 || cur == data_021a63e0) {
        OS_RestoreIrq(state);
        return 0;
    }

    if (*(void **)(cur + 0x70) != a1) {
        if (prev == 0) {
            *(char **)(data_021a63d0 + 0x8) = *(char **)(a0 + 0x68);
        } else {
            *(char **)(prev + 0x68) = *(char **)(a0 + 0x68);
        }
        *(void **)(a0 + 0x70) = a1;
        func_020920bc(a0);
        func_02091f88();
    }

    OS_RestoreIrq(state);
    return 1;
}
