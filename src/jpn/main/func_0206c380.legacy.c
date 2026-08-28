extern void func_02070f40(void *arg0);
extern void func_02070e24(void *p);
extern void func_02070e5c(void);
extern void func_02070f00(void);
extern void func_02070dc0(int a);
extern void func_0206c9d8(void);

int func_0206c380(void *outer) {
    char *self = *(char **)((char *)outer + 0x4);
    func_02070f40(self);
    signed char code = *(signed char *)(self + 0x73);
    char *ctx = *(char **)(self + 0x68);
    switch (code) {
        case 0:
        case 4:
            func_02070e24(ctx + 0x20);
            func_02070e5c();
            break;
        case 1:
            func_02070e5c();
            func_02070f00();
            func_02070dc0((int)func_0206c9d8);
            break;
        case 2:
            func_02070f00();
            break;
        case 3:
            break;
    }
    *(unsigned short *)(self + 0x70) = 1;
    return 0;
}
