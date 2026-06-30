typedef unsigned char u8;
typedef unsigned int u32;

extern int data_0210249c;
extern u8 *func_0208ddec(void *a);
extern void func_02094030(int handle, void *dst, void *src, u32 size);
extern void Copy32(void *dst, void *src, u32 size);

void func_0208f718(void *a, int b, u32 c) {
    u8 *p = func_0208ddec(a);
    int handle = data_0210249c;
    if (handle != -1 && c > 0x30) {
        func_02094030(handle, a, p + b, c);
    } else {
        Copy32(a, p + b, c);
    }
}
