extern char data_ov002_022cf16c[];
extern char data_ov002_022cf17c[];
extern unsigned int func_0202b878(int id);
extern unsigned int func_0202b8a8(int id);
extern int func_ov002_021ca440(int arg0, int arg1);
extern int func_ov002_021b3fd8(int arg0, int arg1, int arg2, int arg3);
extern void func_ov002_02253458(int player, int kind, int idx);
struct Slot { unsigned id:13; unsigned lo:1; unsigned pad:8; unsigned hi:8; unsigned pad2:2; };
void func_ov002_0224a038(int player, int unused, unsigned card) {

    unsigned target;
    int idx;
    int id;
    char *base;
    int side = player & 1;

    struct Slot *row;
    idx = 0;
    if (*(unsigned *)((unsigned)data_ov002_022cf17c + side * 0x868) <= idx) return;
    {

        row = (struct Slot *)(data_ov002_022cf16c + side * 0x868 + 0x260);
        base = data_ov002_022cf16c + side * 0x868;


        do {

            id = row->id;
            if (func_0202b878(id) == 10 && (target = card + 1) == func_0202b8a8(id) && func_ov002_021ca440(player, id) != 0) {
                if (func_ov002_021b3fd8(player, 11, 0x12a1, row->hi * 2 + row->lo) == 0) {
                    func_ov002_02253458(player, 13, idx);
                }
            }
            idx++;
            row++;
        } while (idx < *(unsigned *)(base + 0x10));
    }
}






