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
extern char data_ov002_022cf1a2[];
extern int func_ov002_021c1ef0(struct Ov002Self *self, int player, int idx);
extern int func_ov002_021c1e44(struct Ov002Self *self, int player, int idx);

int func_ov002_021eb630(struct Ov002Self *self, int player, int idx) {
    int off;
    struct Ov002Slot *slot;
    u16 *cf1a4_entry;
    u16 *cf1a2_entry;

    if (idx >= 5) {
        return 0;
    }
    if (player == self->b0) {
        return 0;
    }

    off = (player & 1) * 0x868;
    slot = (struct Ov002Slot *)(data_ov002_022cf16c + off + 0x30 + idx * 0x14);
    if (slot->id == 0) {
        return 0;
    }

    cf1a4_entry = (u16 *)(data_ov002_022cf1a4 + off + idx * 0x14);
    if (*cf1a4_entry == 0) {
        return 0;
    }

    if (func_ov002_021c1ef0(self, player, idx) == 0) {
        return 0;
    }
    if (func_ov002_021c1e44(self, player, idx) != 0) {
        return 0;
    }

    cf1a2_entry = (u16 *)(data_ov002_022cf1a2 + off + idx * 0x14);
    return (*cf1a2_entry == 0) ? 1 : 0;
}
