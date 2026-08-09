extern int func_02075928(void *self);
extern int func_020754f4(void *self);
extern void func_0207655c(int a);
extern void func_02075394(void *self);
extern int func_02074ef4(void *self);

int func_02074e58(void *self) {
    if (func_02075928(self) != 1) {
        return 1;
    }
    if (func_020754f4(self) != 0) {
        func_0207655c(*(int *)((char *)self + 0xc));
        func_02075394(self);
        if (func_02074ef4(self) != 0) {
            return 1;
        }
    } else {
        if (func_02075928(self) != 5) {
            return 1;
        }
        if (func_02074ef4(self) != 0) {
            return 1;
        }
        func_02075394(self);
    }
    return 0;
}
