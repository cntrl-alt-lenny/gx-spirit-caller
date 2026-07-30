extern int func_ov002_021b4040(int val, int kind, int c);
extern void func_ov002_021d5a90(int a, int b, int c, int d);
extern void func_ov002_021e2fc4(int packed, int a, int b);

int func_ov002_02263560(int arg0) {
    int i;
    for (i = 0; i < 2; i++) {
        int v = arg0 ^ i;
        int result = func_ov002_021b4040(v, 11, 0x15b8);
        if (result >= 0) {
            func_ov002_021d5a90(v, 11, 0x15b8, 0);
            int packed = 0x0a5015b8 | ((unsigned)(v << 31) & 0x80000000u);
            func_ov002_021e2fc4(packed, 0, result);
            return 0;
        }
    }
    return 1;
}
