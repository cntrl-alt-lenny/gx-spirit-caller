/* func_ov002_0222054c: bail if a0's bit2 (offset+4) is set, or if
 * a0->count (byte at offset+7) != 2. Otherwise build a bitmask over
 * i=0..count-1: for each i, split func_ov002_0223de94(a0,i)'s result
 * into low/high bytes (low from the raw value, high from the
 * u16-truncated value >>8); if func_ov002_0223df38(a0,i,0) is nonzero,
 * set bit (high + low*16) of the mask. Finally call
 * func_ov002_021de9c0(a0, mask).
 */
typedef unsigned char u8;
typedef unsigned short u16;

struct SA0 {
    char _pad0[4];
    u16 _pad4_2 : 2;
    u16 bit2 : 1;
    u16 _pad4_rest : 13;
    u16 _pad6_lo : 8;
    u16 count : 8;
};

extern int func_ov002_0223de94(void *node, int idx);
extern int func_ov002_0223df38(void *self, int a, int b);
extern void func_ov002_021de9c0(void *self, int mask);

int func_ov002_0222054c(struct SA0 *a0) {
    int mask;
    int i;

    if (a0->bit2) {
        return 0;
    }
    if (a0->count != 2) {
        goto return_zero;
    }

    mask = 0;
    for (i = 0; i < a0->count; i++) {
        int nodeResult = func_ov002_0223de94(a0, i);
        int lowByte = nodeResult & 0xff;
        int highByte = ((u16)nodeResult >> 8) & 0xff;

        if (func_ov002_0223df38(a0, i, 0) != 0) {
            mask |= 1 << (highByte + (lowByte << 4));
        }
    }

    func_ov002_021de9c0(a0, mask);

return_zero:
    return 0;
}
