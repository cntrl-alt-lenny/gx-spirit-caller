extern char *data_0219db98;
extern void func_0204032c(void);
extern void func_02040384(void);
extern void func_0204543c(int a, int b, int c);

void func_02047fdc(void) {
    if (*(int *)(data_0219db98 + 0x24) != 0) {
        func_02040384();
        func_0204032c();
        func_0204543c(0, *(int *)(data_0219db98 + 0x24), 0);
        *(int *)(data_0219db98 + 0x24) = 0;
    }
    data_0219db98 = 0;
}
