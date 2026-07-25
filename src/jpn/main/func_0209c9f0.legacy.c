extern char data_021a83e0[];
extern int data_021a8a00;
extern int data_021a8a20;
extern void func_0209bfe8(void);
extern int func_0209c9d8(void);
extern void func_0209d570(void);

void func_0209c9f0(void) {
    char *base = data_021a83e0;
    if (*(int *)(base + 0x114) != 0)
        return;
    *(int *)(base + 0x114) = 1;
    *(int *)(base + 0x24) = 0;
    *(int *)(base + 0x20) = *(int *)(base + 0x24);
    *(int *)(base + 0x1c) = *(int *)(base + 0x20);
    *(int *)(base + 0x28) = -1;
    *(int *)(base + 0x38) = 0;
    *(int *)(base + 0x3c) = 0;
    data_021a8a00 = 0;
    func_0209bfe8();
    data_021a8a20 = func_0209c9d8();
    func_0209d570();
}
