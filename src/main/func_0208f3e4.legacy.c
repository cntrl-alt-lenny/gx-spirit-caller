extern void Copy32(void *dst, void *src, int n);
extern void func_02093e38(int handle, void *src, void *dst, int n, int e, int f);
extern int data_021a6324;
extern int data_0210249c;

void func_0208f3e4(void *a, int b, int n) {
    char *dst = (char *)data_021a6324 + b;
    int handle = data_0210249c;
    if (handle != -1) {
        func_02093e38(handle, a, dst, n, 0, 0);
    } else {
        Copy32(a, dst, n);
    }
}
