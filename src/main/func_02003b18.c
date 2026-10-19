extern char *data_02102c7c[];
extern void func_02002200(char *p, int a, int b, int c, int d, int e, int f);
extern char *func_020038c0(int a, int b);

void func_02003b18(int *a0, int a1, int a2, int a3, int a4, int a5) {
    int stride;
    int kind;
    char *base = 0;
    if (data_02102c7c[0] != 0 || a1 < 0x80) {
        switch (a5) {
        case 8:
            stride = 0x20;
            base = data_02102c7c[34] + 0x80;
            kind = 4;
            break;
        case 10:
            stride = 0x32;
            base = data_02102c7c[36] + 0x80;
            kind = 5;
            break;
        case 12:
            stride = 0x48;
            base = data_02102c7c[38] + 0x80;
            kind = 6;
            break;
        case 14:
            stride = 0x62;
            base = data_02102c7c[40] + 0x80;
            kind = 7;
            break;
        case 16:
            stride = 0x80;
            base = data_02102c7c[42] + 0x80;
            kind = 8;
            break;
        }
        if (base == 0) return;
        func_02002200(base + stride * a1, a3, a4, a5, *a0, a2, kind);
    } else {
        func_02002200(func_020038c0(a1, a5), a3, a4, a5, *a0, a2, a5 / 2);
    }
}


