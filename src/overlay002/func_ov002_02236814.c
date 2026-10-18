#include "ov002_core.h"

struct Self02236814Arg {
    char _pad[2];
    u16 b0 : 1;
    u16 idx5 : 5;
    u16 _rest2 : 10;
    u16 _fbit0 : 1;
    u16 bit1 : 1;
    u16 bit2 : 1;
    u16 bit3 : 1;
    u16 _pad45 : 2;
    u16 val9 : 9;
    u16 _pad15 : 1;
};

struct Row02236814 {
    u32 _p0 : 13;
    u32 lo : 1;
    u32 _p1 : 8;
    u32 hi : 8;
    u32 _p2 : 2;
};

extern char data_ov002_022cf16c[];
extern void func_ov002_021d8904(int player, int idx, int value);
extern int func_ov002_021de910(int a, int b, int c);

int func_ov002_02236814(int arg0, struct Self02236814Arg *self) {
    struct Row02236814 *row;

    self->bit1 = 1;
    self->bit2 = self->bit1;
    self->bit3 = self->bit2;

    row = (struct Row02236814 *)(data_ov002_022cf16c + (self->b0 & 1) * 0x868 + 0x30 + self->idx5 * 20);
    if (row->hi * 2 + row->lo == self->val9) {
        func_ov002_021d8904(self->b0, self->idx5, self->val9);
        func_ov002_021de910(arg0, self->b0, self->idx5);
    }
    return 0;
}
