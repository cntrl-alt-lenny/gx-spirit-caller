extern void GetSystemWork(void);
extern int func_02019604(void *);
extern int func_020197ac(void *);

int func_02019820(void *arg0) {
    GetSystemWork();
    if (func_02019604(arg0) < 5) {
        goto ret0;
    }
    if (func_020197ac(arg0) > 0) {
        return 1;
    }
ret0:
    return 0;
}
