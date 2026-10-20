struct Self {
    unsigned short f0;
    unsigned short owner : 1;
    unsigned short : 15;
    unsigned short : 6;
    unsigned short value : 9;
    unsigned short : 1;
};
struct Slot {
    unsigned int id : 13;
    unsigned int half : 1;
    unsigned int : 8;
    unsigned int level : 8;
    unsigned int : 2;
};
extern int func_ov002_021bc8c8(int owner, int player, int idx);
extern char data_ov002_022cf16c[];
int func_ov002_021f1170(struct Self *self, int player, int idx) {
    struct Slot *slot;
    if (func_ov002_021bc8c8(self->owner, player, idx) == 0)
        return 0;
    slot = (struct Slot *)(data_ov002_022cf16c + (player & 1) * 0x868 + 0x30 + idx * 0x14);
    return self->value != slot->level * 2 + slot->half;
}
