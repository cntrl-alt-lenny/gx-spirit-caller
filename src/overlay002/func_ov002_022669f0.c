extern int func_ov002_021b4120(int, int, int);
extern void func_ov002_021d5b80(int, int, int, int);
extern int func_ov002_021e30b4(int, int, int);

int func_ov002_022669f0(int arg0) {
    int r = func_ov002_021b4120(arg0, 0xb, 0x140c);
    if (r >= 0) {
        func_ov002_021d5b80(arg0, 0xb, 0x140c, 0);
        func_ov002_021e30b4(((arg0 << 31) & 0x80000000) | 0x0450140c, 0, r);
        return 0;
    }
    return 1;
}
