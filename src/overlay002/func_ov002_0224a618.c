extern char data_ov002_022cf16c[];
extern char data_ov002_022cf178[];
extern char data_ov002_022cf17c[];
extern void func_ov002_02253458(int player, int kind, int idx);
struct Slot { unsigned id:13; unsigned rest:19; };
void func_ov002_0224a618(int player, int unused, int card) {
    int off = (player & 1) * 0x868;
    unsigned idx = 0;
    if (*(unsigned *)(data_ov002_022cf178 + off) > idx) {
        struct Slot *row = (struct Slot *)(data_ov002_022cf16c + off + 0x120);
        char *base = data_ov002_022cf16c + off;
        do {
            if (card == row->id) func_ov002_02253458(player, 11, idx);
            idx++;
            row++;
        } while (idx < *(unsigned *)(base + 0xc));
    }
    idx = 0;
    if (*(unsigned *)(data_ov002_022cf17c + off) > idx) {
        struct Slot *row = (struct Slot *)(data_ov002_022cf16c + off + 0x260);
        char *base = data_ov002_022cf16c + off;
        do {
            if (card == row->id) func_ov002_02253458(player, 13, idx);
            idx++;
            row++;
        } while (idx < *(unsigned *)(base + 0x10));
    }
}
