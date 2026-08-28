extern void func_020951f0(void);
extern void func_02092800(void *addr, int len);
extern void func_020951dc(void);

void func_02095d34(char *param0, int param1, int param2) {
    func_020951f0();
    *(int *)(param0 + param1 * 4 + 0x3c) = param2;
    func_02092800(param0 + 0x3c + param1 * 4, 4);
    func_020951dc();
}
