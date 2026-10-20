extern char data_ov002_022cf16c[];
extern char data_ov002_022cf178[];
extern char data_ov002_022cf17c[];
extern char data_ov002_022cf184[];
extern int func_0202e234(int x);
extern int func_02030808(int a);
extern int func_02030b84(int a0);
extern int func_ov002_021ca440(int arg0, int arg1);
extern int func_ov002_021ca3f0(int arg0, int arg1);
extern int func_ov002_021b3fd8(int arg0, int arg1, int arg2, int arg3);
extern void func_ov002_02253458(int player, int area, int index);
struct Slot { unsigned id:13; unsigned lo:1; unsigned pad:1; unsigned pad2:7; unsigned hi:8; unsigned pad3:2; };
void func_ov002_0224a778(int player) {
    int off = (player & 1) * 0x868;
    unsigned idx = 0;
    if (*(unsigned *)(data_ov002_022cf178 + off) > idx) {
        struct Slot *row = (struct Slot *)(data_ov002_022cf16c + off + 0x120);
        char *base = data_ov002_022cf16c + off;
        do {
            int id = row->id;
            if (func_0202e234(id) != 0 && func_ov002_021ca440(player, id) != 0) {
                func_ov002_02253458(player, 11, idx);
            }
            idx++;
            row++;
        } while (idx < *(unsigned *)(base + 0xc));
    }
    idx = 0;
    if (*(unsigned *)(data_ov002_022cf17c + off) > idx) {
        int id;
        struct Slot *row = (struct Slot *)(data_ov002_022cf16c + off + 0x260);
        char *base = data_ov002_022cf16c + off;
        do {
            id = row->id;
            if (func_0202e234(id) != 0 && func_ov002_021ca440(player, id) != 0) {
                if (func_ov002_021b3fd8(player, 11, 0x12a1, row->hi * 2 + row->lo) == 0) {
                    func_ov002_02253458(player, 13, idx);
                }
            }
            idx++;
            row++;
        } while (idx < *(unsigned *)(base + 0x10));
    }
    idx = 0;
    if (*(unsigned *)(data_ov002_022cf184 + off) > idx) {
        struct Slot *row = (struct Slot *)(data_ov002_022cf16c + off + 0x3a0);
        char *base = data_ov002_022cf16c + off;
        do {
            int id = row->id;
            if (func_02030808(id) != 0 && func_02030b84(id) != 0 && func_ov002_021ca3f0(player, id) != 0) {
                func_ov002_02253458(player, 12, idx);
            }
            idx++;
            row++;
        } while (idx < *(unsigned *)(base + 0x18));
    }
}







