extern char *data_0219d9f0;
extern void func_020927b8(char *p);
extern void func_02092748(void *p);

void func_02042190(int value) {
    func_020927b8(data_0219d9f0 + 0x11dc);
    *(int *)(data_0219d9f0 + 0x1000) = value;
    func_02092748(data_0219d9f0 + 0x11dc);
}
