/* func_ov002_0222ba38: decode self->unk14 into (low,high) bytes; if
 * 021b3ecc(low, high, f0) holds, replay it via 021de4b0. */
extern int func_ov002_021b3ecc(int a, int b, int f0);
extern void func_ov002_021de4b0(void *self, int a, int b);

int func_ov002_0222ba38(void *self) {
    int t = *(int *)((char *)self + 0x14);
    int lo = (unsigned char)t;
    int hi = (unsigned char)((unsigned short)t >> 8);
    if (func_ov002_021b3ecc(lo, hi, *(unsigned short *)self) != 0)
        func_ov002_021de4b0(self, lo, hi);
    return 0;
}
