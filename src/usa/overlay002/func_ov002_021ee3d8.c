typedef unsigned short u16;

struct Ov002Self {
    u16 f0;
    u16 b0 : 1;
};

struct Ov002Slot {
    unsigned int id : 13;
};

extern char data_ov002_022cf08c[];
extern char data_ov002_022ce1a8[];
extern char data_ov002_022cf0c4[];
extern int func_ov002_021c1d64(struct Ov002Self *self, int player, int idx);
extern int func_ov002_021c8400(int player, int idx);
extern int func_ov002_021ee35c(int a, int b);
extern int func_ov002_021b9dec(int player, int idx);
extern int func_0202ed3c(void);

int func_ov002_021ee3d8(struct Ov002Self *self, int player, int idx) {
    int off;
    struct Ov002Slot *slot;
    u16 f0;

    if (player != self->b0) {
        return 0;
    }
    if (idx >= 5) {
        return 0;
    }

    off = (player & 1) * 0x868;
    slot = (struct Ov002Slot *)(data_ov002_022cf08c + off + 0x30 + idx * 0x14);
    if (slot->id == 0) {
        return 0;
    }
    if (func_ov002_021c1d64(self, player, idx) != 0) {
        return 0;
    }

    f0 = self->f0;
    switch (f0) {
        case 0x14c1: {
            int r;
            int j;
            int count = 0;
            struct Ov002Slot *row;

            r = func_ov002_021c8400(player, idx);
            if (r == 0) {
                return 0;
            }

            row = (struct Ov002Slot *)(data_ov002_022cf08c + off + 0x30);
            for (j = 0; j <= 4; j++, row = (struct Ov002Slot *)((char *)row + 0x14)) {
                if (idx == j) {
                    continue;
                }
                if (row->id != 0) {
                    u16 result = (u16)func_ov002_021c8400(player, j);
                    unsigned int v = *(unsigned int *)(data_ov002_022ce1a8 + 0x494) + count;
                    u16 *dst = (u16 *)(data_ov002_022ce1a8 + ((v << 25) >> 24));
                    *(u16 *)((char *)dst + 0x400 + 0x98) = result;
                    count++;
                }
            }

            return func_ov002_021ee35c(count - 1, *(u16 *)((char *)self + 0xc) - r);
        }
        case 0x1a05: {
            u16 gate = *(u16 *)(data_ov002_022cf0c4 + off + idx * 0x14);
            if (gate != 0) {
                func_ov002_021b9dec(player, idx);
                return func_0202ed3c() == 0 ? 1 : 0;
            }
            return 1;
        }
        default:
            return 1;
    }
}
