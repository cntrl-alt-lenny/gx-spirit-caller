typedef long long s64;
extern int func_0208bf3c(int x);
extern short func_0208c490(int y, int x);
extern char data_ov000_021c73e0[];
void func_ov000_021aa8d4(void) {
    int x;
    int *obj = *(int **)data_ov000_021c73e0;
    int dx = obj[12] - obj[9];
    int dz = obj[14] - obj[11];
    int len = func_0208bf3c((int)(((s64)dx * dx + 0x800) >> 12) + (int)(((s64)dz * dz + 0x800) >> 12));
    x = obj[9] - obj[12];
    *(short *)((char *)obj + 0x12c) = (short)(((s64)func_0208c490(obj[10] - obj[13], len) * 0x28be60db9391LL + 0x80000000000LL) >> 44);
    *(short *)((char *)obj + 0x12e) = (short)(((s64)func_0208c490(x, obj[11] - obj[14]) * 0x28be60db9391LL + 0x80000000000LL) >> 44);
    *(short *)((char *)obj + 0x130) = 0;
}

