typedef unsigned int u32;

extern int data_021023bc;
extern void func_02093f3c(int handle, void *dst, void *src, u32 len);
extern void Copy32(void *dst, void *src, u32 len);

void func_0208fd08(void *dst, int off, u32 len) {
    int handle = data_021023bc;
    if (handle != -1 && len > 0x30) {
        func_02093f3c(handle, dst, (void *)(off + 0x07000400), len);
    } else {
        Copy32(dst, (void *)(off + 0x07000400), len);
    }
}
