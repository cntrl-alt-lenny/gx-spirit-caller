/* func_ov002_022636cc: try func_ov002_021b4120(arg0^i, 11, 0x16b9) for i=0,1;
 * on a non-negative result, fire func_ov002_021d5b80 and
 * func_ov002_021e30b4 with a packed payload and return 0. If neither i
 * works, return 1. */
extern int func_ov002_021b4120(int a, int b, int c);
extern int func_ov002_021d5b80(int a, int b, int c, int d);
extern void func_ov002_021e30b4(int a, int b, int c);

int func_ov002_022636cc(int arg0) {
    int i;
    for (i = 0; i < 2; i++) {
        int x = arg0 ^ i;
        int result = func_ov002_021b4120(x, 11, 0x16b9);
        if (result >= 0) {
            unsigned int signbit = (x << 31) & 0x80000000u;
            func_ov002_021d5b80(x, 11, 0x16b9, 0);
            func_ov002_021e30b4(signbit | 0xa4f16b9, (unsigned)(result << 13) >> 16, result);
            return 0;
        }
    }
    return 1;
}
