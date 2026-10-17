extern int func_ov002_021b41a4(int a, int b, int c);
extern void func_ov002_021d5c50(int a, int b, int c, int d);
extern void func_ov002_021e30b4(unsigned int a, int b, int c);

int func_ov002_02266a50(int a)
{
    int r = func_ov002_021b41a4(a, 0xb, 0x1a02);
    if (r >= 0) {
        unsigned int v;
        func_ov002_021d5c50(a, 0xb, 0x1a02, r);
        v = ((a << 31) & 0x80000000) | 0x04501a02;
        func_ov002_021e30b4(v, 0, r);
        return 0;
    }
    return 1;
}
