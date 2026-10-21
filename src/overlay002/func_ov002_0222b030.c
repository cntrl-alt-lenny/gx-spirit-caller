typedef unsigned short u16;
typedef unsigned int u32;
struct Node0223def4 {
    u16 f0;
    u16 player:1;
    u16 rest:15;
    u16 f4;
    u16 low:8;
    u16 count:8;
    u16 arr8[5];
    u16 f18;
};
extern char data_ov002_022cf16c[];
extern int func_ov002_0223def4(struct Node0223def4 *self, int idx);
extern int func_ov002_021b9a30(u32 a, u32 b);
extern int func_ov002_021d7ee4(struct Node0223def4 *self, int player, void *card);
int func_ov002_0222b030(struct Node0223def4 *self) {
    if (self->count) {
        int value = func_ov002_0223def4(self, self->count - 1);
        int index = func_ov002_021b9a30(self->player, value);
        if (index >= 0) {
            func_ov002_021d7ee4(self, self->player,
                data_ov002_022cf16c + (self->player & 1) * 0x868 + 0x5d0 + index * 4);
        }
        self->count = (u16)(self->count + 0xffff);
        return 0x80;
    }
    return 0;
}

