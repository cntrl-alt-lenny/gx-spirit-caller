extern void func_020480b4(int a, int b);

int func_02046498(int code) {
    int kind;
    int sub;
    if (code == 0) {
        return 0;
    }
    switch (code) {
    case 1:
        kind = 9;
        sub = -1;
        break;
    case 2:
    case 5:
        kind = 0;
        sub = 0;
        code = 0;
        break;
    case 3:
        kind = 6;
        sub = -10;
        break;
    case 4:
        kind = 6;
        sub = -30;
        break;
    case 6:
        kind = 6;
        sub = -70;
        break;
    case 7:
        kind = 6;
        sub = -80;
        break;
    }
    if (kind != 0) {
        func_020480b4(kind, sub - 67000);
    }
    return code;
}
