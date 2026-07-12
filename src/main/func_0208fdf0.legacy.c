typedef unsigned int u32;

extern int data_0210249c;
extern void func_02094030(int handle, void *dst, void *src, u32 len);
extern void Copy32(void *dst, void *src, u32 len);

void func_0208fdf0(void *dst, int off, u32 len) {
    int handle = data_0210249c;
    if (handle != -1 && len > 0x30) {
        func_02094030(handle, dst, (void *)(off + 0x07000400), len);
    } else {
        Copy32(dst, (void *)(off + 0x07000400), len);
    }
}
