union Flags {
    unsigned short raw;
    struct { unsigned short player : 1; } bits;
};
struct Self { unsigned short pad; union Flags flags; char pad4[16]; void *p; };
struct State { int pad; int player; int busy; char padc[20]; int row; };
extern struct State data_ov002_022cd3f4;
extern char data_ov002_022cf1a4[];
extern int func_ov002_021b90a8(int arg0, int arg1);
int func_ov002_0220decc(struct Self *self) {
    int player, row;
    if ((unsigned)(self->flags.raw << 20) >> 26 == 0x12 && self->p != 0) {
        player = data_ov002_022cd3f4.player;
        row = data_ov002_022cd3f4.row;
        if (player == self->flags.bits.player && data_ov002_022cd3f4.busy == 0) {
            if (*(unsigned short *)(data_ov002_022cf1a4 + (player & 1) * 0x868 + row * 20) != 0) {
                if (func_ov002_021b90a8(player, row) != 0) return 1;
            }
        }
    }
    return 0;
}
