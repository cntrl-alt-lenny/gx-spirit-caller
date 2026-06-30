extern void Copy32(void *dst, void *src, int n);
extern void func_02093d44(int handle, void *src, void *dst, int n, int e, int f);
extern int data_021023bc;

void func_0208f20c(void *a, int b, int n) {
    int handle = data_021023bc;
    if (handle != -1) {
        func_02093d44(handle, a, (char *)(b + 0x06898000), n, 0, 0);
    } else {
        Copy32(a, (char *)(b + 0x06898000), n);
    }
}
