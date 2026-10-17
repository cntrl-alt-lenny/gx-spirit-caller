struct Cur {
    unsigned int player : 1;
    unsigned int mid : 22;
    unsigned int sel : 9;
};
struct Slot {
    unsigned int c : 13;
    unsigned int lo : 1;
    unsigned int b : 8;
    unsigned int hi : 8;
    unsigned int a : 2;
};
extern struct Cur data_ov002_022cd300;
extern char data_ov002_022cf16c[];

int func_ov002_022716a8(unsigned int player, int kind, int idx) {
    struct Cur *cur = &data_ov002_022cd300;
    if (player == cur->player && kind == 0xb) {
        struct Slot *s = (struct Slot *)(data_ov002_022cf16c + (player & 1) * 0x868 + 0x120);
        if (cur->sel != s[idx].hi * 2 + s[idx].lo) {
            return 0x800;
        }
    }
    return 0;
}
