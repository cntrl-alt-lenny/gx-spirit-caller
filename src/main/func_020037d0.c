extern char *data_02102c7c[];
extern void func_02001f18(char *p, int a, int b, int c, int d, int e, int f);

void func_020037d0(int *a0, int a1, int a2, int a3, int a4, int a5) {
    int stride;
    int kind;
    char *base;

    switch (a5) {
    case 8:
        stride = 0x20;
        base = data_02102c7c[0x88 / 4] + 0x80;
        kind = 4;
        break;
    case 10:
        stride = 0x32;
        base = data_02102c7c[0x90 / 4] + 0x80;
        kind = 5;
        break;
    case 12:
        stride = 0x48;
        base = data_02102c7c[0x98 / 4] + 0x80;
        kind = 6;
        break;
    case 14:
        stride = 0x62;
        base = data_02102c7c[0xa0 / 4] + 0x80;
        kind = 7;
        break;
    case 16:
        stride = 0x80;
        base = data_02102c7c[0xa8 / 4] + 0x80;
        kind = 8;
        break;
    default:
        return;
    }
    func_02001f18(base + stride * a1, a3, a4, a5, *a0, a2, kind);
}
