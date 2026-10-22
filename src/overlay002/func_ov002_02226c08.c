struct Ov002Self {
    unsigned short f0;
    unsigned short b0:1;
    unsigned short idx:5;
    unsigned short pad2:10;
    unsigned short pad4:6;
    unsigned short field9:9;
    unsigned short top:1;
    unsigned short pad6[3];
    unsigned short state;
};
struct Slot {
    unsigned int id:13;
    unsigned int flag:1;
    unsigned int pad:8;
    unsigned int value:8;
    unsigned int top:2;
};
extern unsigned char data_ov002_022cf16c[];
extern int func_ov002_021b3618(int player, int idx);
extern int func_ov002_021d6808(struct Ov002Self *self, int player, int idx, int arg3, int arg4);
extern int func_ov002_02226268(void *self, int a1);
int func_ov002_02226c08(struct Ov002Self *self, int arg) {
    int player, idx, result;
    struct Slot *slot;
    if (self->state == 2) {
        player = self->b0;
        idx = self->idx;
        slot = (struct Slot *)(data_ov002_022cf16c + (player & 1) * 0x868 + 0x30 + idx * 20);
        if (self->field9 != slot->value * 2 + slot->flag)
            return 0;
        result = func_ov002_021b3618(player, idx);
        func_ov002_021d6808(self, result & 0xff, (((unsigned short)result) >> 8) & 0xff, 0, 0);
        return 0;
    }
    return func_ov002_02226268(self, arg);
}
