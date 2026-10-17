struct A {
    unsigned short f0;
    unsigned short f2;
    unsigned short f4;
    char pad[0x806];
    int f80c;
    int f810;
};
extern struct A data_ov002_022ce950;
extern void func_ov002_0229ade0(int a, int b, int c, int d);
extern int func_ov002_0229c7f8(int a);
extern void func_ov002_021b0bdc(int a, int b);

void func_ov002_021d1618(void) {
    int flag = (data_ov002_022ce950.f0 & 0x8000) ? 1 : 0;
    unsigned int x = data_ov002_022ce950.f2;
    unsigned int y = data_ov002_022ce950.f4;
    if (data_ov002_022ce950.f810 == 0) {
        func_ov002_0229ade0(0x2e, flag, x, y);
        func_ov002_021b0bdc(0x25, y);
        data_ov002_022ce950.f810++;
        return;
    }
    if (func_ov002_0229c7f8(0x2e) == 0) {
        data_ov002_022ce950.f80c = 0;
    }
}
