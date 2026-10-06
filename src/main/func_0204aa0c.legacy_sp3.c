extern int func_020469b4(void);
extern void func_020480b4(int a, int b);
extern void func_0204931c(int a, int b);
extern void func_02050054(void *a0, void *a1);
extern void func_0204525c(int a0, int a1);

int func_0204aa0c(int code) {
    int sub;
    int kind;
    if (code == 0) {
        return 0;
    }
    switch (code) {
    case 1:
        kind = 6;
        sub = -50;
        break;
    case 2:
        kind = 6;
        sub = -60;
        break;
    case 3:
        kind = 6;
        sub = -30;
        break;
    case 4:
        kind = 6;
        sub = -80;
        break;
    case 5:
        kind = 6;
        sub = -20;
        break;
    }
    switch (func_020469b4()) {
    case 2:
        func_020480b4(kind, sub - 64000);
        break;
    case 4:
        func_0204931c(kind, sub - 74000);
        break;
    case 5:
        func_02050054((void *)kind, (void *)(sub - 84000));
        break;
    default:
        func_0204525c(kind, sub - 94000);
        break;
    }
    return code;
}
