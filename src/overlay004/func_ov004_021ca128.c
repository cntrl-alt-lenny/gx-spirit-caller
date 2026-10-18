extern void func_0201eaa0(int, void *, int *, int, int, int, int, int, int, int, int, int);

void func_ov004_021ca128(int *obj, int mode, int x0, int x1, int n, int index) {
    int xs[2];
    xs[0] = x0 << 12;
    xs[1] = x1 << 12;
    func_0201eaa0(mode, *(void **)((char *)obj + index * 4 + 0x10), xs,
                  0, 0, 0, n + 8, n, obj[1], obj[0] << 9, 0, 0);
}