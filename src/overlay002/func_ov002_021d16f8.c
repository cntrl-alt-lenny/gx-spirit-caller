/* func_ov002_021d16f8: ov002_022ce950 ticker. If f_810=="state" is
 * nonzero, query func_ov002_0229c7f8(0x37) and clear f_80c when it's 0.
 * Otherwise call func_ov002_021b009c(), pack bit15-of-f_0 + low byte of
 * f_2 into one u16 and the byte-split-then-rejoined f_4 into another,
 * post them + f_6 via func_ov002_0229ade0(0x37,...), then increment
 * f_810.
 */
typedef unsigned char u8;
typedef unsigned short u16;

typedef struct {
    unsigned short f0;
    unsigned short f2;
    unsigned short f4;
    unsigned short f6;
    char _pad0[0x804];
    int f80c;
    int f810;
} S021d16f8;

extern S021d16f8 data_ov002_022ce950;
extern void func_ov002_021b009c(void);
extern int func_ov002_0229ade0(int cmd, int a, int b, int c);
extern int func_ov002_0229c7f8(int cmd);

void func_ov002_021d16f8(void) {
    int bit15;
    unsigned short f4;
    int state;
    unsigned short f2;
    int f4lo;
    int f4hi;
    unsigned short f6;
    u16 arg1;
    u16 arg2;

    bit15 = (data_ov002_022ce950.f0 & 0x8000) ? 1 : 0;
    f4 = data_ov002_022ce950.f4;
    state = data_ov002_022ce950.f810;
    f4lo = f4 & 0xff;
    f2 = data_ov002_022ce950.f2;
    f4hi = (f4 >> 8) & 0xff;
    f6 = data_ov002_022ce950.f6;

    if (state == 0) {
        func_ov002_021b009c();
        arg1 = (u16)((u8)bit15 | ((u8)f2 << 8));
        arg2 = (u16)((u8)f4lo | ((u8)f4hi << 8));
        func_ov002_0229ade0(0x37, arg1, arg2, f6);
        data_ov002_022ce950.f810 = data_ov002_022ce950.f810 + 1;
        return;
    }

    if (func_ov002_0229c7f8(0x37) == 0) {
        data_ov002_022ce950.f80c = 0;
    }
}
