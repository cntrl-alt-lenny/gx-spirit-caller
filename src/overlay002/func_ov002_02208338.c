struct Self0 { unsigned short f0; unsigned short bit0 : 1; unsigned short _r : 15; };

extern int func_ov002_021ff2c8(struct Self0 *self, int bit0);
extern int func_ov002_021bd3e0(int bit0, int k);

int func_ov002_02208338(struct Self0 *self) {
    int result1 = func_ov002_021ff2c8(self, self->bit0);
    int result2 = func_ov002_021bd3e0(self->bit0, 1);
    if (result2 == 0) return 0;
    if (result1 != 0) {
        return result1 <= result2;
    }
    return 0;
}
