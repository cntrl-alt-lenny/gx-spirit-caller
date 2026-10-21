extern unsigned int func_0202b878(int id);
extern unsigned int func_0202b8a8(int id);
extern int func_ov002_021ca440(int arg0, int arg1);
extern void func_ov002_02253458(int player, int kind, int idx);
extern char data_ov002_022cf16c[];
extern char data_ov002_022cf17c[];
struct Slot { unsigned int id : 13; unsigned int rest : 19; };
void func_ov002_022527b8(int player, int unused, unsigned int limit) {
    int side = player & 1;
    unsigned int idx = 0;
    unsigned int count = *(unsigned int *)(data_ov002_022cf17c + side * 0x868);
    if (count > idx) {
        struct Slot *row = (struct Slot *)(data_ov002_022cf16c + side * 0x868 + 0x260);
        char *base = data_ov002_022cf16c + side * 0x868;
        do {
            int id = row->id;
            if (func_0202b878(id) == 9) {
                if (func_0202b8a8(id) <= limit) {
                    if (func_ov002_021ca440(player, id) != 0) {
                        func_ov002_02253458(player, 13, idx);
                    }
                }
            }
            idx++;
            row++;
        } while (idx < *(unsigned int *)(base + 0x10));
    }
}
