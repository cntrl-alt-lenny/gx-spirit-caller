extern void Copy32(void *dst, void *src, int n);
extern void func_02093d44(int handle, void *src, void *dst, int n, int e, int f);
extern int data_021023bc;
extern int data_021a624c;
extern int data_021a6250;

void func_0208f444(void *a, int b, int n) {
    int base0 = data_021a6250;
    int base1 = data_021a624c;
    char *dst = ((char *)base0 + b) - base1;
    int handle = data_021023bc;
    if (handle != -1) {
        func_02093d44(handle, a, dst, n, 0, 0);
    } else {
        Copy32(a, dst, n);
    }
}
