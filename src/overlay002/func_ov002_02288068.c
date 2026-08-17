#include <nitro/types.h>

extern int func_ov002_022576d8(void *self);
extern int func_ov002_0227d684(int bit0, int flag, int val);
extern int func_ov002_021c8470(int a, int b);
extern int func_ov002_02257ab8(void *self, int side);

typedef struct {
    u16 f_0;
    u16 f_2;
    u16 f_4;
    u16 f_6;
    u16 f_8;
} Self02288068;

#define BIT0(x)  (((unsigned)((x) << 31)) >> 31)

int func_ov002_02288068(Self02288068 *self) {
    int v;
    int r;
    unsigned short lo;

    v = func_ov002_022576d8(self);
    r = func_ov002_0227d684(BIT0(self->f_2), 0, v);
    if (r < 0) {
        return 0;
    }

    self->f_6 = (self->f_6 & ~0xff00) | 0x100;
    lo = (unsigned short)r;
    self->f_8 = func_ov002_021c8470(r & 0xff, (lo >> 8) & 0xff);

    r = func_ov002_02257ab8(self, 1 - BIT0(self->f_2));
    return r > 0 ? 1 : 0;
}
