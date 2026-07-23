extern void *data_0219d9d4;
extern void func_020927b8(void *p);
extern void func_02092748(void *p);
extern void func_02041ea0(void);
extern void func_02091af4(void *p);

void func_020403d4(void) {
    if (data_0219d9d4 == 0) {
        return;
    }
    func_020927b8((char *)data_0219d9d4 + 0x13d8);
    *(int *)((char *)data_0219d9d4 + 0x13f0) = 1;
    func_02092748((char *)data_0219d9d4 + 0x13d8);
    if (*(int *)((char *)data_0219d9d4 + 0x1314) != 0) {
        func_02041ea0();
    }
    if (*(int *)((char *)data_0219d9d4 + 0x1384) != 0) {
        func_02091af4((char *)data_0219d9d4 + 0x1318);
    }
}
