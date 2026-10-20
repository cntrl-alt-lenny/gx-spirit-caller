typedef unsigned short u16;
struct Self { u16 f0; u16 player:1; u16 index:5; u16 rest:10; };
struct State { char pad[0xcec]; int player; char pad2[8]; int mode; };
extern struct State data_ov002_022d016c;
extern char data_ov002_022cf1a4[];
extern int func_ov002_021bc8c8(int, int, int);
extern int func_ov002_022577dc(void *self);
int func_ov002_021ff87c(struct Self *self) {
    int player = self->player;
    int index;
    if (player != data_ov002_022d016c.player) return 0;
    if (data_ov002_022d016c.mode != 1) return 0;
    index = self->index;
    if (*(u16 *)(data_ov002_022cf1a4 + (player & 1) * 0x868 + index * 0x14) == 0) return 0;
    if (func_ov002_021bc8c8(player, player, index) == 0) return 0;
    if (func_ov002_022577dc(self) >= 2) return 2;
    return 0;
}
