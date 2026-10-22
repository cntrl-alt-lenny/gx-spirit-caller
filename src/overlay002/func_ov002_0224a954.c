extern char data_ov002_022cf16c[];
extern char data_ov002_022cf17c[];
extern int func_0202e234(int x);
extern int func_ov002_021b3fd8(int arg0, int arg1, int arg2, int arg3);
extern void func_ov002_02253458(int player, int kind, int idx);
struct Slot { unsigned id:13; unsigned lo:1; unsigned pad:8; unsigned hi:8; unsigned pad2:2; };
void func_ov002_0224a954(int player) {
    int side = player & 1;
    unsigned idx = 0;
    if (*(unsigned *)((unsigned)data_ov002_022cf17c + side * 0x868) > idx) {
        struct Slot *row = (struct Slot *)((unsigned)data_ov002_022cf16c + side * 0x868 + 0x260);
        char *base = (char *)((unsigned)data_ov002_022cf16c + side * 0x868);
        do {
            if (func_0202e234(row->id) != 0) {
                if (func_ov002_021b3fd8(player, 11, 0x12a1, row->hi * 2 + row->lo) == 0) {
                    func_ov002_02253458(player, 13, idx);
                }
            }
            idx++;
            row++;
        } while (idx < *(unsigned *)(base + 0x10));
    }
}




