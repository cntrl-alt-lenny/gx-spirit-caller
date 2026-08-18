extern int func_02053114(void *p);
extern int func_020530e4(void *p);
extern void func_02052c38(void *p);
extern void func_02053158(void *p, int v);
extern void func_02032748(void *self);

int func_0203320c(int *self) {
    char *n = (char *)self + 0x1fc;

    if (func_02053114(n + 0xc40)) {
        if (func_020530e4(n + 0xc40)) {
            func_02052c38(n + 0xc40);
            return 1;
        }
        func_02052c38(n + 0xc40);
        return 0;
    }
    func_02053158(n + 0xc40, *self);
    func_02052c38(n + 0xc40);
    func_02032748(self);
    return 0;
}
