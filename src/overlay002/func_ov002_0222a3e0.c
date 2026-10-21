typedef unsigned short u16;
typedef unsigned int u32;
struct Node0223def4 {
    u16 f0;
    u16 player:1; u16 rest2:15;
    u16 f4;
    u16 low6:8; u16 count:8;
    u16 arr8[5]; u16 f18;
};
struct State { char pad[0x5a8]; int mode; u32 mask; };
typedef struct { u16 id:13; u16 rest:3; u16 other; } Card;
extern struct State data_ov002_022ce288;
extern Card data_ov002_022d0250[];
extern int func_ov002_0223def4(struct Node0223def4 *self, int idx);
extern int func_ov002_021b947c(int id);
extern int func_ov002_021d7268(int player, int id, int flag);
extern int func_0202e2c8(int unused0);
extern int func_ov002_021e286c(int arg0);
int func_ov002_0222a3e0(struct Node0223def4 *self) {
    int id, packed, player, index;
    switch (data_ov002_022ce288.mode) {
    case 0x80:
        data_ov002_022ce288.mask = 0;
    case 0x7f:
        if (self->count != 0) {
            id = func_ov002_0223def4(self, self->count - 1);
            packed = func_ov002_021b947c(id);
            player = (unsigned char)packed;
            index = (u16)((u32)packed >> 16);
            if (index >= 0) {
                func_ov002_021d7268(player, id, 1);
                if (func_0202e2c8(data_ov002_022d0250[id].id) == 0)
                    data_ov002_022ce288.mask |= 1 << player;
            }
            self->count--;
            return 0x7f;
        }
        if (data_ov002_022ce288.mask & (1 << self->player))
            func_ov002_021e286c(self->player);
        if (data_ov002_022ce288.mask & (1 << (1 - self->player)))
            func_ov002_021e286c(1 - self->player);
        return 0;
    default:
        return 0;
    }
}
