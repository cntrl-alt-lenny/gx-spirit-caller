typedef unsigned int u32;

extern int data_0210249c;
extern void func_02093fb8(int handle, void *dst, void *src, u32 len);
extern void func_020944a4(void *dst, void *src, u32 len);

void func_0208feb4(void *a, int b, u32 n) {
    int handle = data_0210249c;
    if (handle != -1 && n > 0x1c) {
        func_02093fb8(handle, a, (void *)(b + 0x05000600), n);
    } else {
        func_020944a4(a, (void *)(b + 0x05000600), n);
    }
}
