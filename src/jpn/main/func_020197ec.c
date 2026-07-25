extern void GetSystemWork(void);
extern int func_020195d0(void *);
extern int func_02019778(void *);

int func_020197ec(void *arg0) {
    GetSystemWork();
    if (func_020195d0(arg0) < 5) {
        goto ret0;
    }
    if (func_02019778(arg0) > 0) {
        return 1;
    }
ret0:
    return 0;
}
