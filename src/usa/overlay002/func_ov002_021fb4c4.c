#include "ov002_core.h"

struct SelfB5B4 {
    u16 f0;
    u16 b0 : 1;
    u16 pad : 15;
    u16 f4;
    u16 f6;
    u16 f8;
};

extern int func_ov002_0220cce4(struct SelfB5B4 *self);
extern int func_ov002_021f4994(struct SelfB5B4 *self, int arg1);
extern int func_ov002_021c8860(int b0, int i);
extern int func_ov002_021dea94(int b0, int mask);

int func_ov002_021fb4c4(struct SelfB5B4 *self, int arg1) {
    int kind;
    int count;
    int i;

    if (func_ov002_0220cce4(self) == 0) return -1;
    kind = func_ov002_021f4994(self, arg1);
    if (kind == 1) {
        count = 0;
        for (i = 0; i < 5; i++) {
            if (func_ov002_021c8860(self->b0, i) == 0x11) count++;
        }
        func_ov002_021dea94(self->b0, 0x1f << (self->b0 << 4));
        self->f8 = count;
    }
    return kind;
}
