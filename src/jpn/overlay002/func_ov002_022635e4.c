/* func_ov002_022635e4: try func_ov002_021b4040(arg0^i, 11, 0x16b9) for i=0,1;
 * on a non-negative result, fire func_ov002_021d5a90 and
 * func_ov002_021e2fc4 with a packed payload and return 0. If neither i
 * works, return 1. */
extern int func_ov002_021b4040(int a, int b, int c);
extern int func_ov002_021d5a90(int a, int b, int c, int d);
extern void func_ov002_021e2fc4(int a, int b, int c);

int func_ov002_022635e4(int arg0) {
    int i;
    for (i = 0; i < 2; i++) {
        int x = arg0 ^ i;
        int result = func_ov002_021b4040(x, 11, 0x16b9);
        if (result >= 0) {
            unsigned int signbit = (x << 31) & 0x80000000u;
            func_ov002_021d5a90(x, 11, 0x16b9, 0);
            func_ov002_021e2fc4(signbit | 0xa4f16b9, (unsigned)(result << 13) >> 16, result);
            return 0;
        }
    }
    return 1;
}
