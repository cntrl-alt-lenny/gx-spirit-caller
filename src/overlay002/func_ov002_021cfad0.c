typedef struct {
    unsigned short a;
    unsigned short b;
    char pad[0x808];
    int f80c;
    int f810;
} Ctx;

extern Ctx data_ov002_022ce950;
extern int func_ov002_0229ade0(int a, int b, int c, int d);
extern int func_ov002_0229c7f8(int a);

void func_ov002_021cfad0(void) {
    int r5 = (data_ov002_022ce950.a & 0x8000) != 0;
    int r4 = data_ov002_022ce950.b;
    switch (data_ov002_022ce950.f810) {
    case 0:
        func_ov002_0229ade0(0x43, r5, r4, 0);
        data_ov002_022ce950.f810++;
        break;
    case 1:
        if (func_ov002_0229c7f8(0x43) != 0)
            return;
        func_ov002_0229ade0(0x20, (r5 & 1) | 0x20, r4, 0);
        data_ov002_022ce950.f810++;
        break;
    case 2:
        if (func_ov002_0229c7f8(0x20) == 0)
            data_ov002_022ce950.f80c = 0;
        break;
    }
}
