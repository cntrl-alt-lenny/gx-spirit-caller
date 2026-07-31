typedef unsigned short u16;

struct Ov002Self {
    u16 f0;
    u16 b0 : 1;
};

struct Ov002Slot {
    unsigned int id : 13;
};

extern char data_ov002_022cf16c[];
extern char data_ov002_022ce288[];
extern char data_ov002_022cf1a4[];
extern int func_ov002_021c1e44(struct Ov002Self *self, int player, int idx);
extern int func_ov002_021c84e0(int player, int idx);
extern int func_ov002_021ee44c(int a, int b);
extern int func_ov002_021b9ecc(int player, int idx);
extern int func_0202ed90(void);

int func_ov002_021ee4c8(struct Ov002Self *self, int player, int idx) {
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
    slot = (struct Ov002Slot *)(data_ov002_022cf16c + off + 0x30 + idx * 0x14);
    if (slot->id == 0) {
        return 0;
    }
    if (func_ov002_021c1e44(self, player, idx) != 0) {
        return 0;
    }

    f0 = self->f0;
    switch (f0) {
        case 0x14c1: {
            int r;
            int j;
            int count = 0;
            struct Ov002Slot *row;

            r = func_ov002_021c84e0(player, idx);
            if (r == 0) {
                return 0;
            }

            row = (struct Ov002Slot *)(data_ov002_022cf16c + off + 0x30);
            for (j = 0; j <= 4; j++, row = (struct Ov002Slot *)((char *)row + 0x14)) {
                if (idx == j) {
                    continue;
                }
                if (row->id != 0) {
                    u16 result = (u16)func_ov002_021c84e0(player, j);
                    unsigned int v = *(unsigned int *)(data_ov002_022ce288 + 0x494) + count;
                    u16 *dst = (u16 *)(data_ov002_022ce288 + ((v << 25) >> 24));
                    *(u16 *)((char *)dst + 0x400 + 0x98) = result;
                    count++;
                }
            }

            return func_ov002_021ee44c(count - 1, *(u16 *)((char *)self + 0xc) - r);
        }
        case 0x1a05: {
            u16 gate = *(u16 *)(data_ov002_022cf1a4 + off + idx * 0x14);
            if (gate != 0) {
                func_ov002_021b9ecc(player, idx);
                return func_0202ed90() == 0 ? 1 : 0;
            }
            return 1;
        }
        default:
            return 1;
    }
}
