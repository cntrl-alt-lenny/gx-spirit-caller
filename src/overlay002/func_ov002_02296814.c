/* func_ov002_02296814: gate on func_ov002_02259f74(self->b0), then on the
 * per-(b0&1)-row, idx-indexed (bits[5:1] of u16@2, 20-byte stride)
 * data_ov002_022cf1a2 entry being zero, then on
 * func_ov002_021be4a0(b0,idx,1), finally returns whether
 * func_ov002_021bbd14(b0,0x195a) > 0. */
typedef struct {
    unsigned short f0;
    unsigned short b0 : 1;
    unsigned short idx : 5;
} SelfIdx;

extern unsigned short data_ov002_022cf1a2[];
extern int func_ov002_02259f74(int b0);
extern int func_ov002_021be4a0(int b0, int idx, int one);
extern int func_ov002_021bbd14(int b0, int arg2);

int func_ov002_02296814(SelfIdx *self) {
    int rowOff, idx;

    if (func_ov002_02259f74(self->b0) == 0)
        return 0;

    rowOff = (self->b0 & 1) * 0x868;
    idx = self->idx;
    if (*(unsigned short *)((char *)data_ov002_022cf1a2 + rowOff + idx * 20) != 0)
        return 0;

    if (func_ov002_021be4a0(self->b0, idx, 1) != 0) {
        return func_ov002_021bbd14(self->b0, 0x195a) > 0;
    }
    return 0;
}
