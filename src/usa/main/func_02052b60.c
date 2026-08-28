extern void func_02000b60(void *arg);
extern int  func_02044888(void *self);
extern int  func_02044bc0(int x);
extern void func_02044e58(void *self);

int func_02052b60(void *self) {
    int flag = 0;
    int x;

    func_02000b60((void *)0x02000b8c);

    x = func_02044888(self);
    if (func_02044bc0(x) != 0) {
        func_02044e58(self);
        flag = 1;
    }

    if (x < 0) {
        return flag ? 2 : 3;
    }
    return flag ? 1 : 0;
}
