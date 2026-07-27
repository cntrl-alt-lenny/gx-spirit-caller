extern int func_ov002_021b3dec(int a, int b, int c);
extern void func_ov002_021df5e4(int a, int b);
extern void func_ov002_021d5a90(int a, int b, int c, int d);
extern void func_ov002_021df848(int a, int b, int c, int d);

int func_ov002_02264a3c(int arg0) {
    if (func_ov002_021b3dec(arg0, 0xb, 0x1a9d) == 0)
        return 1;
    func_ov002_021df5e4(arg0, 0x1a9d);
    func_ov002_021d5a90(arg0, 0xb, 0x1a9d, 0);
    func_ov002_021df848(1 - arg0, 0x3e8, 1, 0x1a9d);
    return 0;
}
