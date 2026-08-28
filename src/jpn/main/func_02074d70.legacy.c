extern int func_02075840(void *self);
extern int func_0207540c(void *self);
extern void func_02076474(int a);
extern void func_020752ac(void *self);
extern int func_02074e0c(void *self);

int func_02074d70(void *self) {
    if (func_02075840(self) != 1) {
        return 1;
    }
    if (func_0207540c(self) != 0) {
        func_02076474(*(int *)((char *)self + 0xc));
        func_020752ac(self);
        if (func_02074e0c(self) != 0) {
            return 1;
        }
    } else {
        if (func_02075840(self) != 5) {
            return 1;
        }
        if (func_02074e0c(self) != 0) {
            return 1;
        }
        func_020752ac(self);
    }
    return 0;
}
