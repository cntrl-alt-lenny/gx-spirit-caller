extern void *data_0219d9d4;
extern void func_020927b8(void *);
extern void func_02092748(void *);

void func_0203f778(int a) {
    func_020927b8((char *)data_0219d9d4 + 0x13d8);
    *(int *)((char *)data_0219d9d4 + 0x1000 + 4) = a;
    func_02092748((char *)data_0219d9d4 + 0x13d8);
}
