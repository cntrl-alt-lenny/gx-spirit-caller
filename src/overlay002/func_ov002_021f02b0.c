extern char data_ov002_022cf16c[];
extern char data_ov002_022cf1a4[];
extern int func_0202e2f8(int id);
extern int func_ov002_021b90a8(int a, int b);
extern int func_ov002_021bc8c8(int a, int b, int c);

struct Self {
    unsigned short f0;
    unsigned short side : 1;
};

struct Slot {
    unsigned id : 13;
};

int func_ov002_021f02b0(struct Self *self, int player, int idx) {
    int base = (player & 1) * 0x868;
    int off = idx * 20;
    if (func_0202e2f8(((struct Slot *)(data_ov002_022cf16c + base + 0x30 + off))->id) != 0)
        return 0;
    if (func_ov002_021b90a8(player, idx) == 0)
        return 0;
    if (func_ov002_021bc8c8(self->side, player, idx) != 0) {
        if (self->side == player || *(unsigned short *)(data_ov002_022cf1a4 + base + off) != 0)
            return 1;
    }
    return 0;
}
