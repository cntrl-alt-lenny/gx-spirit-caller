typedef unsigned short u16;

typedef struct {
    u16 a;
    u16 b;
    char pad[0x808];
    int c;
    int d;
} Data;

extern Data data_ov002_022ce950;
extern int func_ov002_0229ade0(int a, int b, int c, int d);
extern int func_ov002_0229c7f8(int a);
extern void func_ov002_021b0b54(int a, int b);

void func_ov002_021d1888(void)
{
    int flag = (data_ov002_022ce950.a & 0x8000) != 0;
    int d = data_ov002_022ce950.d;
    u16 v = data_ov002_022ce950.b;
    if (d == 0) {
        func_ov002_0229ade0(0x39, flag, v, 0);
        data_ov002_022ce950.d++;
        return;
    }
    if (func_ov002_0229c7f8(0x39) != 0) {
        return;
    }
    if (v != 0) {
        func_ov002_021b0b54(0x3e, 1);
    }
    data_ov002_022ce950.c = 0;
}
