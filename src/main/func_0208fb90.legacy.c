typedef unsigned char u8;
typedef unsigned int u32;

extern int data_0210249c;
extern u8 *func_0208e1ac(void *a);
extern void func_02093fb8(int handle, void *dst, void *src, u32 size);
extern void func_020944a4(void *dst, void *src, u32 size);

void func_0208fb90(void *a, int b, u32 c) {
    u8 *p = func_0208e1ac(a);
    int handle = data_0210249c;
    if (handle != -1 && c > 0x1c) {
        func_02093fb8(handle, a, p + b, c);
    } else {
        func_020944a4(a, p + b, c);
    }
}
