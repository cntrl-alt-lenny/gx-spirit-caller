typedef unsigned short u16;

struct D016c {
    char _pad[0xcf8];
    int f_cf8;
};

struct SelfF2 {
    u16 player : 1;
    u16 _pad : 5;
    u16 field6 : 6;
};

struct Slot {
    unsigned int id : 13;
};

extern struct D016c data_ov002_022d016c;
extern char data_ov002_022cf16c[];
extern int func_ov002_021c8940(int player, int i);

int func_ov002_022095ac(void *self_raw) {
    struct SelfF2 *self2;
    int i;
    int count = 0;
    int row_offset;

    if (data_ov002_022d016c.f_cf8 != 2) {
        return 0;
    }

    self2 = (struct SelfF2 *)((char *)self_raw + 2);

    for (i = 0, row_offset = 0; i <= 4; i++, row_offset += 0x14) {
        int player = self2->player;
        char *row = data_ov002_022cf16c + (player & 1) * 0x868 + row_offset;
        struct Slot *slot = (struct Slot *)(row + 0x30);
        u16 field38;
        u16 field36;

        if (slot->id == 0) {
            continue;
        }
        field38 = *(u16 *)(row + 0x38);
        if (field38 == 0) {
            continue;
        }
        field36 = *(u16 *)(row + 0x36);
        if (field36 != 0) {
            continue;
        }
        if (func_ov002_021c8940(player, i) == 0x12) {
            count++;
        }
    }

    if (self2->field6 == 0x23) {
        return (count > 0) ? 1 : 0;
    }
    return (count >= 2) ? 1 : 0;
}
