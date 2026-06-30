extern void Copy32(void *dst, void *src, int n);
extern void func_02093d44(int handle, void *src, void *dst, int n, int e, int f);
extern int data_021a6244;
extern int data_021023bc;

void func_0208f2fc(void *a, int b, int n) {
    char *dst = (char *)data_021a6244 + b;
    int handle = data_021023bc;
    if (handle != -1) {
        func_02093d44(handle, a, dst, n, 0, 0);
    } else {
        Copy32(a, dst, n);
    }
}
