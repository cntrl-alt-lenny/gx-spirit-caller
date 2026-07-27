typedef unsigned short u16;

struct Self02221fc0 {
    char _pad[4];
    u16 f4lo : 2;
    u16 bit2 : 1;
    u16 rest : 13;
};

extern int func_ov002_0223df38(void *self, int a, int b);
extern u16 func_ov002_0223de94(void *self, int idx);
extern int func_ov002_0225764c(void *self, int lo, int hi);
extern int func_ov002_021d6c98(void *self, int lo, int hi);

int func_ov002_02221fc0(struct Self02221fc0 *self) {
    if (self->bit2 != 0)
        return 0;
    if (func_ov002_0223df38(self, 0, 0) == 0)
        goto done;
    {
        u16 raw = func_ov002_0223de94(self, 0);
        int lo = raw & 0xff;
        int zx = (unsigned int)(raw << 16) >> 16;
        int hi = (zx >> 8) & 0xff;
        if (func_ov002_0225764c(self, lo, hi) == 0)
            goto done;
        func_ov002_021d6c98(self, lo, hi);
    }
done:
    return 0;
}
