extern void func_02050054(void *a0, void *a1);

int func_0204aaf4(int code) {
    int kind;
    int sub;
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
        sub = -30;
        break;
    case 3:
        kind = 6;
        sub = -20;
        break;
    case 4:
        kind = 6;
        sub = -40;
        break;
    case 5:
        kind = 9;
        sub = -1;
        break;
    case 6:
        kind = 9;
        sub = -2;
        break;
    }
    func_02050054((void *)kind, (void *)(sub - 85000));
    return code;
}
