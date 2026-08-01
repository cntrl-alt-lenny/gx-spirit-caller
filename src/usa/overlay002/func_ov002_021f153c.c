typedef unsigned short u16;

struct Ov002Self {
    u16 f0;
    u16 b0 : 1;
};

struct Ov002Slot {
    unsigned int id : 13;
};

extern char data_ov002_022cf08c[];
extern int func_ov002_021c1e10(struct Ov002Self *self, int player, int idx);
extern int func_ov002_021c1d64(struct Ov002Self *self, int player, int idx);
extern int func_ov002_021c1fa4(struct Ov002Self *self, int player, int idx, int flag);

int func_ov002_021f153c(struct Ov002Self *self, int player, int idx) {
    struct Ov002Slot *slot = (struct Ov002Slot *)(data_ov002_022cf08c + (player & 1) * 0x868 + idx * 0x14 + 0x30);

    if (slot->id == 0) {
        return 0;
    }
    if (player == self->b0) {
        return 0;
    }
    if (func_ov002_021c1e10(self, player, idx) == 0) {
        return 0;
    }
    if (func_ov002_021c1d64(self, player, idx) != 0) {
        return 0;
    }
    return (func_ov002_021c1fa4(self, player, idx, 1) != 0) ? 1 : 0;
}
