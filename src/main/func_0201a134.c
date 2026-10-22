extern int func_02019210(int x);
extern void func_02018a84(void *arg0, void *arg1);
extern unsigned int data_02104f4c[];
extern char data_020b59e0[];

void func_0201a134(int x) {
    int n = func_02019210(x) - 0x44;
    unsigned int flags;
    unsigned short value;
    flags = data_02104f4c[0x29d];
    flags |= 1 << n;
    value = ((unsigned short *)(data_020b59e0 + 0x62))[n];
    data_02104f4c[0x29d] = flags;
    func_02018a84((void *)value, (void *)1);
}
