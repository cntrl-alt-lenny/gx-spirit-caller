typedef unsigned short u16;

struct Self {
    u16 f0;
    struct {
        u16 bit0  : 1;
        u16 _rest : 15;
    } f2;
    u16 _pad4;
    struct {
        u16 lo : 8;
        u16 hi : 8;
    } f6;
};

extern char data_ov002_022cf16c[];
extern int func_ov002_021ff3bc(void *self);
extern int func_ov002_0223def4(void *self, int idx);
extern int func_ov002_021b947c(void);
extern int func_ov002_021c33e4(int a, int b, int c);
extern int func_ov002_0227adb8(int a, int b, int c, int d);

/* func_ov002_02229a88: gate on func_ov002_021ff3bc(self) and self's field6
 * top byte == 1; call func_ov002_0223def4(self, 0), then decode
 * func_ov002_021b947c()'s packed return (lo byte, mid byte via
 * (u16)>>8, hi16), requiring mid == 14; func_ov002_021c33e4 gates a
 * final func_ov002_0227adb8 dispatch into the per-player cf16c table. */
int func_ov002_02229a88(struct Self *self) {
    if (func_ov002_021ff3bc(self) == 0)
        return 0;

    if (self->f6.hi != 1)
        goto tail;

    func_ov002_0223def4(self, 0);
    {
        int ret = func_ov002_021b947c();
        int lo = ret & 0xff;
        int mid = ((u16)ret >> 8) & 0xff;
        int hi16 = (u16)((unsigned int)ret >> 16);

        if (mid != 14)
            goto tail;

        if (func_ov002_021c33e4(self->f2.bit0, lo, hi16) == 0)
            goto tail;

        {
            char *addr = data_ov002_022cf16c + (lo & 1) * 0x868 + 0x418 + hi16 * 4;
            func_ov002_0227adb8(self->f2.bit0, (int)addr, 1, self->f0 << 16);
        }
    }

tail:
    return 0;
}
