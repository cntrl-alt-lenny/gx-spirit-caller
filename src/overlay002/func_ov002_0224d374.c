extern char data_ov002_022cf180[];
extern char data_ov002_022cf16c[];
extern int func_0202e234(int x);
extern int func_ov002_021b9128(int a, int b);
extern void func_ov002_02253458(int player, int kind, int idx);
struct Slot { unsigned int id:13; unsigned int rest:19; };
void func_ov002_0224d374(int player, int unused, int mode) {
    int side = player & 1;
    unsigned int idx = 0;
    unsigned int count = *(unsigned int *)(data_ov002_022cf180 + side * 0x868);
    if (count > idx) {
        int id;
        struct Slot *row = (struct Slot *)(data_ov002_022cf16c + side * 0x868 + 0x418);
        char *base = data_ov002_022cf16c + side * 0x868;
        do {
            id = row->id;
            if (func_0202e234(id) != 0) {
                if (func_ov002_021b9128(id, mode ? 2 : 1) != 0) {
                    func_ov002_02253458(player, 14, idx);
                }
            }
            idx++;
            row++;
        } while (idx < *(unsigned int *)(base + 0x14));
    }
}

