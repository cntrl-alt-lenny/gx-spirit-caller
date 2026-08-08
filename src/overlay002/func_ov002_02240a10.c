#include "ov002_core.h"

struct Self02240a10 {
    u16 f0;
    u16 b0 : 1;
    u16 _pad1 : 15;
    u16 _f4;
    u16 f6;
};

extern int func_ov002_022575c8(void *self);

int func_ov002_02240a10(struct Self02240a10 *self, int arg1, int arg2) {
    int hb;

    if (func_ov002_022575c8(self) == 0) {
        return 0;
    }

    hb = ((unsigned int)self->f6 << 16) >> 24;

    switch (hb) {
    case 2:
        return self->b0 != arg1;
    case 1:
        {
            u16 packed = (u8)arg1 | ((u16)(u8)arg2 << 8);
            if (func_ov002_0223de94(self, 0) == packed) {
                return 0;
            }
        }
        /* fallthrough */
    case 0:
        if (arg1 == self->b0) {
            return 1;
        }
        break;
    }
    return 0;
}
