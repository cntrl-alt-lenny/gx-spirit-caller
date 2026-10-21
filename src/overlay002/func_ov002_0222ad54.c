typedef unsigned int u32;
typedef unsigned short u16;
struct Ov002Self {
    u16 f0;
    u16 b0:1;
    char pad[16];
    u32 field:9;
    u32 player:1;
    u32 idx:4;
    u32 rest:18;
};
struct Slot { u32 id:13; u32 flag:1; u32 pad:8; u32 sub:8; u32 top:2; };
extern char data_ov002_022cf16c[];
extern char data_ov002_022cf1a4[];
extern char data_ov002_022cf1a2[];
extern int func_ov002_021d6808(struct Ov002Self *self, int player, int idx, int arg3, int arg4);
int func_ov002_0222ad54(struct Ov002Self *self) {
    int player = self->player;
    int off = (player & 1) * 0x868;
    int idx = self->idx;
    int roff = idx * 20;
    struct Slot *slot = (struct Slot *)(data_ov002_022cf16c + off + 0x30 + roff);
    if (slot->sub * 2 + slot->flag == self->field &&
        *(u16 *)(data_ov002_022cf1a4 + off + roff) != 0 &&
        *(u16 *)(data_ov002_022cf1a2 + off + roff) == 0) {
        func_ov002_021d6808(self, player, idx, 0, 0);
    }
    return 0;
}
