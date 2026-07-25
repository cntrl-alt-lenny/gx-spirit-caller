extern char data_021a84c0[];
extern int data_021a8ae0;
extern int data_021a8b00;
extern void func_0209c0dc(void);
extern int func_0209cacc(void);
extern void func_0209d664(void);

void func_0209cae4(void) {
    char *base = data_021a84c0;
    if (*(int *)(base + 0x114) != 0)
        return;
    *(int *)(base + 0x114) = 1;
    *(int *)(base + 0x24) = 0;
    *(int *)(base + 0x20) = *(int *)(base + 0x24);
    *(int *)(base + 0x1c) = *(int *)(base + 0x20);
    *(int *)(base + 0x28) = -1;
    *(int *)(base + 0x38) = 0;
    *(int *)(base + 0x3c) = 0;
    data_021a8ae0 = 0;
    func_0209c0dc();
    data_021a8b00 = func_0209cacc();
    func_0209d664();
}
