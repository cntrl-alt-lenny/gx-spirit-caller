/* func_ov002_0220a9e0: self carries b0 (bit0) and a 5-bit row (bits1-5).
 * entry = data_ov002_022cf0c8[player_off + row*20] must be nonzero, and
 * func_ov002_021ca5b8(b0,b0) must be nonzero. data_ov002_022cf0a0's
 * per-player slot must be (unsigned) >= entry. Return 0 if
 * func_ov002_022576f4(self) < entry (signed), else 2. */
struct Self0220aad0 {
    unsigned short f_0;
    unsigned short b0 : 1;
    unsigned short row : 5;
    unsigned short _pad : 10;
};

extern char data_ov002_022cf0c8[];
extern char data_ov002_022cf0a0[];
extern int func_ov002_021ca5b8(int b0, int b0_2);
extern int func_ov002_022576f4(void *self);

int func_ov002_0220a9e0(struct Self0220aad0 *self) {
    int b0 = self->b0;
    int row = self->row;
    int entry = *(int *)(data_ov002_022cf0c8 + (b0 & 1) * 0x868 + row * 20);
    int v;
    int r;

    if (entry == 0) {
        return 0;
    }
    if (func_ov002_021ca5b8(b0, b0) == 0) {
        return 0;
    }
    v = *(int *)(data_ov002_022cf0a0 + (self->b0 & 1) * 0x868);
    if ((unsigned int)v < (unsigned int)entry) {
        return 0;
    }
    r = func_ov002_022576f4(self);
    return r < entry ? 0 : 2;
}
