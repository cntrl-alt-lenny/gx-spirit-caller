/* func_0208fd70: if the global DMA handle is valid (!=-1) and the byte
 * count exceeds 0x30, route through func_02093f3c; otherwise fall back
 * to a synchronous Copy32. The src pointer is biased by 0x7000000. `n`
 * must be unsigned (target uses `bls`, an unsigned compare). */

extern void Copy32(void *dst, void *src, int n);
extern void func_02093f3c(int handle, void *dst, void *src, int n);
extern int data_021023bc;

void func_0208fd70(void *dst, int src, unsigned int n) {
    int handle = data_021023bc;
    if (handle != -1 && n > 0x30)
        func_02093f3c(handle, dst, (void *)(src + 0x7000000), n);
    else
        Copy32(dst, (void *)(src + 0x7000000), n);
}
