extern int func_ov002_021b3ecc(int a, int b, int c);
extern void func_ov002_021df6d4(int a, int b);
extern void func_ov002_021d5b80(int a, int b, int c, int d);
extern void func_ov002_021df938(int a, int b, int c, int d);

int func_ov002_02264b24(int arg0) {
    if (func_ov002_021b3ecc(arg0, 0xb, 0x1a9d) == 0)
        return 1;
    func_ov002_021df6d4(arg0, 0x1a9d);
    func_ov002_021d5b80(arg0, 0xb, 0x1a9d, 0);
    func_ov002_021df938(1 - arg0, 0x3e8, 1, 0x1a9d);
    return 0;
}
