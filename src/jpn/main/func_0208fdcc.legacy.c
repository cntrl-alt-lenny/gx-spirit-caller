typedef unsigned int u32;

extern int data_021023bc;
extern void func_02093ec4(int handle, void *dst, void *src, u32 len);
extern void func_020943b0(void *dst, void *src, u32 len);

void func_0208fdcc(void *a, int b, u32 n) {
    int handle = data_021023bc;
    if (handle != -1 && n > 0x1c) {
        func_02093ec4(handle, a, (void *)(b + 0x05000600), n);
    } else {
        func_020943b0(a, (void *)(b + 0x05000600), n);
    }
}
