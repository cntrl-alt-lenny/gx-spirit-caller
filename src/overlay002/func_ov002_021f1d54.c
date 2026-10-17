extern char data_ov002_022cf16c[];
extern char data_ov002_022cf1a4[];

struct Slot {
    unsigned int lo : 13;
    unsigned int rest : 19;
};

struct Obj {
    char pad0[2];
    unsigned short player : 1;
    unsigned short rest : 15;
};

int func_ov002_021f1d54(struct Obj *obj, unsigned int player, unsigned int kind)
{
    struct Slot *slot;

    slot = (struct Slot *)(data_ov002_022cf16c + (player & 1) * 0x868 + 0x30 + kind * 20);
    if (slot->lo == 0) {
        return 0;
    }
    if (obj->player == player) {
        return 0;
    }
    return *(unsigned short *)(data_ov002_022cf1a4 + (player & 1) * 0x868 + kind * 20) == 0;
}
