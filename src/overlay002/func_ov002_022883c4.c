struct Self0 { unsigned short f0; unsigned short bit0 : 1; unsigned short _r : 15; };
extern int func_ov002_02281a74(int bit0);
extern int func_ov002_02257ab8(void *self, int side);

int func_ov002_022883c4(struct Self0 *self) {
    if (func_ov002_02281a74(self->bit0) == 0) return 0;
    {
        int result1 = func_ov002_02257ab8(self, 1 - self->bit0);
        int result2 = func_ov002_02257ab8(self, self->bit0);
        return result1 > result2;
    }
}
