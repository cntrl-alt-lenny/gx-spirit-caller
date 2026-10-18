typedef unsigned short u16;

struct Ov002Self {
    u16 f0;
    u16 b0 : 1;
};

struct Ov002Slot {
    unsigned int id : 13;
};

extern char data_ov002_022cf16c[];
extern char data_ov002_022cf1a4[];
extern int func_ov002_021c1a2c(int player, int idx, int v);
extern int func_ov002_021c1e44(struct Ov002Self *self, int player, int idx);
extern int func_ov002_021c84e0(int player, int idx);

int func_ov002_021ee23c(struct Ov002Self *self, int player, int idx) {
    int off;
    int off2;
    struct Ov002Slot *slot;

    if (idx >= 5) {
        return 0;
    }

    off = (player & 1) * 0x868;
    off2 = idx * 0x14;
    slot = (struct Ov002Slot *)(data_ov002_022cf16c + off + 0x30 + off2);
    if (slot->id == 0) {
        return 0;
    }
    if (player == self->b0) {
        return 0;
    }
    if (*(u16 *)(data_ov002_022cf1a4 + off + off2) == 0) {
        return 0;
    }
    if (func_ov002_021c1a2c(player, idx, self->f0) == 0) {
        return 0;
    }
    if (func_ov002_021c1e44(self, player, idx) != 0) {
        return 0;
    }
    return func_ov002_021c84e0(player, idx) <= 3;
}
