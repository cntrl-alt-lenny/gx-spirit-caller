extern void Copy32(void *dst, void *src, int n);
extern void func_02093e38(int handle, void *src, void *dst, int n, int e, int f);
extern int data_0210249c;

void func_0208f210(void *a, int b, int n) {
    int handle = data_0210249c;
    if (handle != -1) {
        func_02093e38(handle, a, (char *)(b + 0x068a0000), n, 0, 0);
    } else {
        Copy32(a, (char *)(b + 0x068a0000), n);
    }
}
