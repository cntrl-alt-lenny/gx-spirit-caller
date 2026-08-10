extern void func_02061018();
extern void func_02061150();
extern int func_02062cfc(void *self, void *buf1, void *buf2);
extern int func_020643d8();

int func_020640c0(char *self, int unused1, int param2) {
    char buf1[0x20];
    char buf2[0x20];
    int state;

    state = *(int *)(self + 0xc);
    if (state != 2) {
        return func_020643d8(self, unused1) != 0;
    }
    if (param2 < 0x20) {
        return func_020643d8(self, unused1) != 0;
    }

    func_02061018(buf1);
    func_02061150(buf2);
    func_02061018(self + 0x68, buf2);
    if (func_02062cfc(self, buf1, buf2) == 0) {
        return 0;
    }
    *(int *)(self + 0xc) = 3;
    return 1;
}
