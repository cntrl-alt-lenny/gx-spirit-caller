/* func_ov006_021b7920: reset sub-object `idx`, copy its 0x124-byte config
 * block from the shared table at self+0x248, cache a computed value into a
 * per-slot u16 array, and mark bit `idx` of a bitmap (word index computed
 * from idx>>4 divided by 32, bit index idx%32).
 */
extern void func_ov006_021b7f5c(void *p);
extern void Copy32(void *dst, void *src, int n);
extern int func_020123e4(void *p);
extern void func_020091d8(int a, int b, void *c);

int func_ov006_021b7920(void *self, int idx) {
    char *s = (char *)self;
    int *bitmap;
    int wordIdx, bitIdx;

    func_ov006_021b7f5c(self);
    Copy32(s + 0x124, s + 0x248 + idx * 0x124, 0x124);
    *(short *)(s + 0x5fd0 + idx * 2) = (short)func_020123e4(s + 0x140);

    bitmap = (int *)(s + 0x60b4);
    wordIdx = idx / 32;
    bitIdx = idx % 32;
    bitmap[wordIdx] |= 1 << bitIdx;

    func_020091d8(0, idx, s + 0x124);
    return 1;
}
