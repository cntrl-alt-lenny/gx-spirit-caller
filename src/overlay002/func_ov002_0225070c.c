struct Ov002Slot { unsigned int id : 13; unsigned int rest : 19; };
extern char data_ov002_022cf16c[];
extern unsigned int data_ov002_022cf180[];
extern int func_0202e234(int x);
extern int func_0202ef38(int a0);
extern int func_ov002_021c33e4(int player, int side, int idx);
extern void func_ov002_02253458(int player, int kind, int idx);
void func_ov002_0225070c(int player) {
    int b0 = player & 1;
    unsigned int idx = 0;
    unsigned int cnt = *(unsigned int *)((char *)data_ov002_022cf180 + b0 * 0x868);
    if (cnt > idx) {
        struct Ov002Slot *row = (struct Ov002Slot *)(data_ov002_022cf16c + b0 * 0x868 + 0x418);
        char *base = data_ov002_022cf16c + b0 * 0x868;
        do {
            int id = row->id;
            if (func_0202e234(id) != 0 && func_0202ef38(id) != 0 && func_ov002_021c33e4(player, player, idx) != 0) {
                func_ov002_02253458(player, 14, idx);
            }
            idx++;
            row++;
        } while (idx < *(unsigned int *)(base + 0x14));
    }
}
