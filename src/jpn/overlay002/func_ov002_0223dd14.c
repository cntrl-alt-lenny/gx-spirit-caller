#include "ov002_core.h"

struct SelfDE04 {
    char _pad[6];
    union U6 {
        u16 raw;
        struct { u16 byte0 : 8; u16 byte1 : 8; } b;
    } f6;
};

extern void func_ov002_0223db24(struct SelfDE04 *self, int a, int b, int c);
extern void func_ov002_021d860c(int a, int b, int c, int byte0);

void func_ov002_0223dd14(struct SelfDE04 *self, int arg1, int arg2, int arg3) {
    unsigned byte0 = self->f6.b.byte0;

    if (byte0 < 5) {
        func_ov002_0223db24(self, arg1, arg2, arg3);
    } else if (byte0 == 5) {
        *(u16 *)((char *)self + byte0 * 2 + 8) = *(int *)(data_ov002_022ce1a8 + 0x494);
    }
    func_ov002_021d860c(arg1, arg2, arg3, self->f6.b.byte0);
    self->f6.raw = (self->f6.raw & ~0xff) | (((unsigned short)(self->f6.b.byte0 + 1)) & 0xff);
}
