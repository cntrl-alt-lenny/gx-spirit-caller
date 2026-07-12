typedef unsigned char u8;
typedef unsigned int u32;

extern int data_021023bc;
extern u8 *func_0208e0c4(void *a);
extern void func_02093ec4(int handle, void *dst, void *src, u32 size);
extern void func_020943b0(void *dst, void *src, u32 size);

void func_0208faa8(void *a, int b, u32 c) {
    u8 *p = func_0208e0c4(a);
    int handle = data_021023bc;
    if (handle != -1 && c > 0x1c) {
        func_02093ec4(handle, a, p + b, c);
    } else {
        func_020943b0(a, p + b, c);
    }
}
