struct Self0 { unsigned short f0; unsigned short bit0 : 1; unsigned short _r : 15; };
extern int func_ov002_02281964(int bit0);
extern int func_ov002_022579d0(void *self, int side);

int func_ov002_022882b4(struct Self0 *self) {
    if (func_ov002_02281964(self->bit0) == 0) return 0;
    {
        int result1 = func_ov002_022579d0(self, 1 - self->bit0);
        int result2 = func_ov002_022579d0(self, self->bit0);
        return result1 > result2;
    }
}
