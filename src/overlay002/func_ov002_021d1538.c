struct A {
    short pad0;
    unsigned short f2;
    char pad[0x808];
    int f80c;
    int f810;
};
struct B {
    char pad[0xdc];
    unsigned int fdc;
};
extern struct A data_ov002_022ce950;
extern struct B data_ov002_022d016c;
extern void func_ov002_0229ade0(int a, int b, int c, int d);
extern int func_ov002_0229c7f8(int a);

void func_ov002_021d1538(void) {
    data_ov002_022d016c.fdc = data_ov002_022ce950.f2;
    if (data_ov002_022ce950.f810 == 0) {
        data_ov002_022ce950.f810++;
        func_ov002_0229ade0(6, data_ov002_022d016c.fdc, 0, 0);
        return;
    }
    if (func_ov002_0229c7f8(6) == 0) {
        func_ov002_0229ade0(0x24, 0, 0, 0);
        data_ov002_022ce950.f80c = 0;
    }
}
