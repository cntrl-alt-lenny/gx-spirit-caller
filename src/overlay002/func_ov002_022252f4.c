#include "ov002_core.h"

struct Node {
    u16 f0;      /* +0x0 */
    u16 b0 : 1;  /* +0x2 */
    char _pad[8];
    u16 fc;      /* +0xc */
};

extern int func_ov002_0223df38(void *self, int a, int b);
extern int func_ov002_0225764c(void *a, int b, int c);
extern int func_ov002_021d6808(struct Ov002Self *self, int player, int idx, int arg3, int arg4);
extern int func_ov002_021d5a08(struct Ov002Self *arg0, int arg1, int arg2, int arg3, u16 arg4, u16 arg5);
extern int func_ov002_021c1d28(int a, int b, int c);
extern int func_ov002_021c1a2c(int a, int b, u16 c);
extern void func_ov002_0226b11c(int a, int b);

int func_ov002_022252f4(struct Node *self) {
    int v, bit, field;

    if (func_ov002_0223df38(self, 0, 0) == 0)
        goto end;

    v = func_ov002_0223de94(self, 0);
    bit = (u8)v;
    field = (u8)((u16)v >> 8);

    if (func_ov002_0225764c(self, bit, field) == 0)
        goto end;

    switch (self->fc) {
    case 1:
        func_ov002_021d6808((struct Ov002Self *)self, bit, field, 0, 1);
        return 0;
    case 2:
        func_ov002_021d5a08((struct Ov002Self *)self, bit, field, self->f0, 1, self->b0);
        if (bit == self->b0)
            goto case2_end;
        if (func_ov002_021c1d28(bit, field, bit != self->b0) == 0) {
            if (func_ov002_021c1a2c(bit, field, self->f0) != 0)
                func_ov002_0226b11c(bit, field);
        }
    case2_end:
        return 0;
    default:
        goto end;
    }
end:
    return 0;
}
