#include "ov002_core.h"

struct Self0221429c {
    u16 _f0;
    u16 player : 1;
    u16 idx : 5;
    u16 kind : 6;
    u16 _rest : 4;
    u16 _f4a : 2;
    u16 skip : 1;
};

struct Slot0221429c {
    u32 id : 13;
    u32 _rest : 19;
    char _pad[0x10];
};

extern int func_ov002_021c8470(int player, int idx);
extern int func_ov002_021de408(void *self, int mask);
extern void func_ov002_021df818(void *self, int player, int n);
extern void func_ov002_021e2d94(int player, int idx, int a, int b);

int func_ov002_0221429c(struct Self0221429c *self) {
    int i;
    int sum;
    struct Slot0221429c *slot;

    if (self->skip) {
        return 0;
    }
    if (self->kind == 2) {
        sum = 0;
        for (i = 0; i < 5; i++) {
            slot = (struct Slot0221429c *)(data_ov002_022cf16c + (self->player & 1) * 0x868 + 0x30);
            if (slot[i].id != 0) {
                sum += func_ov002_021c8470(self->player, i);
            }
        }
        func_ov002_021de408(self, 0x1f << (self->player << 4));
        func_ov002_021df818(self, 1 - self->player, (sum + 1) >> 1);
    } else {
        func_ov002_021e2d94(self->player, self->idx, 5, 1);
    }
    return 0;
}
