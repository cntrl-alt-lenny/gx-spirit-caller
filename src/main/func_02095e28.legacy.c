extern void func_020952e4(void);
extern void func_020928e8(void *addr, int len);
extern void func_020952d0(void);

void func_02095e28(char *param0, int param1, int param2) {
    func_020952e4();
    *(int *)(param0 + param1 * 4 + 0x3c) = param2;
    func_020928e8(param0 + 0x3c + param1 * 4, 4);
    func_020952d0();
}
