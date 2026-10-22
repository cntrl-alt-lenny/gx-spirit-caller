struct Ov002Slot { unsigned int id : 13; };
extern char data_ov002_022cf16c[];
extern char data_ov002_022cf17c[];
extern int func_0202e234(int x);
extern unsigned int func_0202b8a8(int id);
extern int func_0202f46c(int x);
extern int func_ov002_021ca440(int arg0, int arg1);
extern void func_ov002_02253458(int player, int kind, int idx);
void func_ov002_02252998(int player, int unused, int level) {
    int b0 = player & 1;
    unsigned int idx = 0;
    unsigned int cnt = *(unsigned int *)(data_ov002_022cf17c + b0 * 0x868);
    if (cnt > idx) {
        struct Ov002Slot *row = (struct Ov002Slot *)(data_ov002_022cf16c + b0 * 0x868 + 0x260);
        char *base = data_ov002_022cf16c + b0 * 0x868;
        do {
            int id = row->id;
            if (func_0202e234(id) != 0 && level == func_0202b8a8(id) && func_0202f46c(id) != 0 && func_ov002_021ca440(player, id) != 0) {
                func_ov002_02253458(player, 13, idx);
            }
            idx++;
            row++;
        } while (idx < *(unsigned int *)(base + 0x10));
    }
}
