typedef struct {
    int f0, f4;
    char pad8[0xc];
    int f14;
    char pad18[0xc];
    int f24, f28, f2c;
    char pad30[0x38];
    int f68;
} State;
typedef struct { int f0; unsigned int mode : 3; unsigned int rest : 29; } Config;
extern State data_0219ad48;
extern Config data_02104f4c;
extern void func_02001d68(int arg);
extern int func_0201d4b4(int sel);
extern void func_0202cffc(void);
extern void func_0202d194(int a);
extern void func_0202d1d8(int a);
extern void func_0202d558(void);
extern void func_02094504(int, int, int);
void func_0202cca4(int a) {
    if (data_0219ad48.f0 == 0) return;
    data_0219ad48.f24 = a > 0 ? 1 : 0;
    if (a == 1) a = 0;
    if (data_0219ad48.f24 == 0) {
        if (data_0219ad48.f4 != a) {
            func_02094504(0, func_0201d4b4(data_0219ad48.f68), 0xc0);
        }
        data_0219ad48.f4 = a;
        func_0202d1d8(0);
        return;
    }
    if (data_0219ad48.f4 == a && data_0219ad48.f2c == 0) return;
    func_02001d68(data_02104f4c.mode);
    switch (data_0219ad48.f28) {
    case 0:
    default:
        data_0219ad48.f4 = a;
        func_0202cffc();
        func_0202d558();
        func_0202d194(0);
        break;
    case 1:
        data_0219ad48.f4 = a;
        func_0202cffc();
        data_0219ad48.f4 = 0;
        func_0202d558();
        func_0202d194(0);
        data_0219ad48.f14 = 0;
        data_0219ad48.f4 = a;
        break;
    case 2:
        data_0219ad48.f4 = a;
        func_0202cffc();
        func_0202d558();
        data_0219ad48.f4 = 0;
        func_0202d194(0);
        data_0219ad48.f14 = 0;
        data_0219ad48.f4 = a;
        break;
    }
    data_0219ad48.f2c = 0;
}
