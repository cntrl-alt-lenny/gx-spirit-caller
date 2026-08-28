extern void func_02060fa4();
extern void func_020610dc();
extern int func_02062c88(void *self, void *buf1, void *buf2);
extern int func_02064364();

int func_0206404c(char *self, int unused1, int param2) {
    char buf1[0x20];
    char buf2[0x20];
    int state;

    state = *(int *)(self + 0xc);
    if (state != 2) {
        return func_02064364(self, unused1) != 0;
    }
    if (param2 < 0x20) {
        return func_02064364(self, unused1) != 0;
    }

    func_02060fa4(buf1);
    func_020610dc(buf2);
    func_02060fa4(self + 0x68, buf2);
    if (func_02062c88(self, buf1, buf2) == 0) {
        return 0;
    }
    *(int *)(self + 0xc) = 3;
    return 1;
}
