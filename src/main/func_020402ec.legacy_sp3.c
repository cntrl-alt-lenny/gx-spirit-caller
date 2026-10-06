extern void *data_0219d9d4;
extern void func_020927b8(char *p);
extern void func_02092748(void *p);

int func_020402ec(void) {
    int result;
    if (data_0219d9d4 == 0) {
        return 0x16;
    }
    func_020927b8((char *)data_0219d9d4 + 0x13d8);
    result = *(int *)((char *)data_0219d9d4 + 0x1004);
    func_02092748((char *)data_0219d9d4 + 0x13d8);
    return result;
}
