extern void func_02000b60(void *arg);
extern int  func_020448d8(void *self);
extern int  func_02044c10(int x);
extern void func_02044ea8(void *self);

int func_02052bd4(void *self) {
    int flag = 0;
    int x;

    func_02000b60((void *)0x02000b8c);

    x = func_020448d8(self);
    if (func_02044c10(x) != 0) {
        func_02044ea8(self);
        flag = 1;
    }

    if (x < 0) {
        return flag ? 2 : 3;
    }
    return flag ? 1 : 0;
}
