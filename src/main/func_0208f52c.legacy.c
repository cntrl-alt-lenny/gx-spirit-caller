extern void Copy32(void *dst, void *src, int n);
extern void func_02093e38(int handle, void *src, void *dst, int n, int e, int f);
extern int data_0210249c;
extern int data_021a632c;
extern int data_021a6330;

void func_0208f52c(void *a, int b, int n) {
    int base0 = data_021a6330;
    int base1 = data_021a632c;
    char *dst = ((char *)base0 + b) - base1;
    int handle = data_0210249c;
    if (handle != -1) {
        func_02093e38(handle, a, dst, n, 0, 0);
    } else {
        Copy32(a, dst, n);
    }
}
