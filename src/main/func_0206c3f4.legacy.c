extern void func_02071028(void *arg0);
extern void func_02070f0c(void *p);
extern void func_02070f44(void);
extern void func_02070fe8(void);
extern void func_02070ea8(int a);
extern void func_0206ca4c(void);

int func_0206c3f4(void *outer) {
    char *self = *(char **)((char *)outer + 0x4);
    func_02071028(self);
    signed char code = *(signed char *)(self + 0x73);
    char *ctx = *(char **)(self + 0x68);
    switch (code) {
        case 0:
        case 4:
            func_02070f0c(ctx + 0x20);
            func_02070f44();
            break;
        case 1:
            func_02070f44();
            func_02070fe8();
            func_02070ea8((int)func_0206ca4c);
            break;
        case 2:
            func_02070fe8();
            break;
        case 3:
            break;
    }
    *(unsigned short *)(self + 0x70) = 1;
    return 0;
}
