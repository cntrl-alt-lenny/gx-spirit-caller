struct Ov002Slot { unsigned int id : 13; unsigned int rest : 19; };
extern char data_ov002_022cf16c[];
extern unsigned int data_ov002_022cf17c[];
extern int func_0202e234(int x);
extern int func_0202ef38(int a0);
extern unsigned int func_0202b8a8(int id);
extern void func_ov002_02253458(int player, int kind, int idx);

void func_ov002_02250540(int player) {
    int b0 = player & 1;
    unsigned int idx = 0;
    unsigned int cnt = *(unsigned int *)((char *)data_ov002_022cf17c + b0 * 0x868);
    if (cnt > idx) {
        struct Ov002Slot *row = (struct Ov002Slot *)(data_ov002_022cf16c + b0 * 0x868 + 0x260);
        char *base = data_ov002_022cf16c + b0 * 0x868;
        do {
            int id = row->id;
            if (func_0202e234(id) != 0 && func_0202ef38(id) != 0 && (int)func_0202b8a8(id) <= 4) {
                func_ov002_02253458(player, 13, idx);
            }
            idx++;
            row++;
        } while (idx < *(unsigned int *)(base + 0x10));
    }
}
