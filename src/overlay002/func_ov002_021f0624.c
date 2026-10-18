extern char data_ov002_022cf16c[];

struct Slot {
    unsigned int lo : 13;
    unsigned int rest : 19;
};

struct Obj {
    char pad0[2];
    unsigned short f2pad : 6;
    unsigned short type : 6;
    unsigned short f2rest : 4;
    char pad4[16];
    unsigned int w14pad0 : 16;
    unsigned int player : 1;
    unsigned int kind : 4;
    unsigned int w14rest : 11;
};

int func_ov002_021f0624(struct Obj *obj, unsigned int player, unsigned int kind)
{
    struct Slot *slot;

    if ((int)kind >= 5) {
        return 0;
    }
    slot = (struct Slot *)(data_ov002_022cf16c + (player & 1) * 0x868 + kind * 20 + 0x30);
    if (slot->lo == 0) {
        return 0;
    }
    if (obj->type == 15 && obj->player == player && obj->kind == kind) {
        return 1;
    }
    return 0;
}
