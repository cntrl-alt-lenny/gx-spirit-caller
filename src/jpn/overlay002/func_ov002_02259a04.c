extern int func_ov002_021e2fc4(int a, int b, int c);
extern int func_ov002_021d5b60(int a, int b, int c, int d);

int func_ov002_02259a04(int arg0, int arg1, int arg2) {
    unsigned packed;
    int result;

    packed = ((unsigned)(arg0 << 31) & 0x80000000) | 0x464e0000 | (unsigned short)arg1;
    result = func_ov002_021e2fc4(packed, (unsigned short)arg2, 0);
    if (result == 0)
        return 0;
    func_ov002_021d5b60(arg0, 0xb, 0x1a04, arg2);
    return 1;
}
