typedef unsigned char u8;
typedef unsigned int u32;

extern int data_021023bc;
extern u8 *func_0208de58(void *a);
extern void func_02093f3c(int handle, void *dst, void *src, u32 size);
extern void Copy32(void *dst, void *src, u32 size);

void func_0208f838(void *a, int b, u32 c) {
    u8 *p = func_0208de58(a);
    int handle = data_021023bc;
    if (handle != -1 && c > 0x30) {
        func_02093f3c(handle, a, p + b, c);
    } else {
        Copy32(a, p + b, c);
    }
}
