extern char *data_0219d9f0;
extern void *data_0219d9fc;
extern void func_02041ea0(void);
extern void func_020403d4(void);
extern void func_02091af4(void *p);

void func_02043250(void) {
    if (data_0219d9f0 == 0) {
        return;
    }
    if (data_0219d9fc != 0) {
        func_02041ea0();
    }
    func_020403d4();
    if (*(int *)(data_0219d9f0 + 0x1188) != 0) {
        func_02091af4(data_0219d9f0 + 0x111c);
    }
    *(int *)(data_0219d9f0 + 0x1004) = -7;
}
