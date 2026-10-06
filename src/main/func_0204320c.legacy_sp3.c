extern char *data_0219d9f0;
extern void func_020927b8(char *p);
extern void func_02092748(void *p);

int func_0204320c(void) {
    int value;
    func_020927b8(data_0219d9f0 + 0x11dc);
    value = *(int *)(data_0219d9f0 + 0x1000);
    func_02092748(data_0219d9f0 + 0x11dc);
    return value;
}
