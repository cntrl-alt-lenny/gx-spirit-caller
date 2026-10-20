extern int func_ov002_021b41a4(int arg0, int arg1, int arg2);
extern int func_ov002_021d5c50(int arg0, int arg1, int unused2, int unused3);
extern int func_ov002_021e30b4(int arg0, int arg1, int arg2);
int func_ov002_022678f8(int a, int b, int c) {
    int r = func_ov002_021b41a4(a, 11, c);
    if (r >= 0) {
        func_ov002_021d5c50(a, 11, c, r);
        func_ov002_021e30b4(((unsigned)a << 31 & 0x80000000) | 0x04400000 | (((unsigned)b << 16) & 0x001f0000) | (unsigned short)c, (unsigned short)r, 0);
        return 0;
    } else {
        return 1;
    }
}
