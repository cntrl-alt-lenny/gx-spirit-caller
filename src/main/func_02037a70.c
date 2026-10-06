extern int data_0219b490;
extern void func_020919d8(void *p);
extern int func_02037ac4(void);
extern int func_0203c3dc(void);

int func_02037a70(int lock) {
    int r;

    if (lock != 0) {
        func_020919d8(&data_0219b490);
    }
    r = func_02037ac4();
    if (r != 0) {
        if (r & 1) {
            return 1;
        }
        if ((unsigned int)func_0203c3dc() >= 3) {
            return 1;
        }
    }
    return 0;
}
