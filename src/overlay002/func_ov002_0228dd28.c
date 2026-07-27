struct Ov002Slot {
    unsigned int id : 13;
};

extern char data_ov002_022cf16c[];
extern int func_0202b8f0(int id);

int func_ov002_0228dd28(int arg0, int arg1) {
    struct Ov002Slot *slot;
    unsigned id;
    int result;

    slot = (struct Ov002Slot *)(data_ov002_022cf16c + (arg0 & 1) * 0x868 + arg1 * 0x14 + 0x30);
    id = slot->id;
    if (id == 0x17de)
        return 0x4e20;
    result = func_0202b8f0(id);
    return 0x2710 - result;
}
