extern int func_ov002_021b3ecc(int arg0, int arg1, int arg2);
extern void func_ov002_021d5b80(int arg0, int arg1, int arg2, int arg3);
extern int func_ov002_021e30b4(int arg0, int arg1, int arg2);

int func_ov002_02264558(int arg0) {
    if (func_ov002_021b3ecc(arg0, 0xb, 0x13f5)) {
        func_ov002_021e30b4(((arg0 << 31) & 0x80000000) | 0x0a5013f5, 0, 0);
        func_ov002_021d5b80(arg0, 0xb, 0x13f5, 0);
        return 0;
    }
    return 1;
}
