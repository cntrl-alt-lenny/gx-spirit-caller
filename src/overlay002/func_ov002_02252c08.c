struct Ov002Slot { unsigned int id : 13; };
extern char data_ov002_022cf16c[];
extern int data_ov002_022cf180[];
extern unsigned int func_0202b878(int id);
extern unsigned int func_0202b8a8(int id);
extern void func_ov002_02253458(int player, int kind, int idx);

void func_ov002_02252c08(int player) {
    int b0 = player & 1;
    unsigned int idx = 0;
    unsigned int cnt = *(unsigned int *)((char *)data_ov002_022cf180 + b0 * 0x868);
    if (cnt > idx) {
        struct Ov002Slot *row = (struct Ov002Slot *)(data_ov002_022cf16c + b0 * 0x868 + 0x418);
        char *base = data_ov002_022cf16c + b0 * 0x868;
        do {
            int id = row->id;
            if (func_0202b878(id) == 1 && (int)func_0202b8a8(id) <= 3) {
                func_ov002_02253458(player, 14, idx);
            }
            idx++;
            row++;
        } while (idx < *(unsigned int *)(base + 0x14));
    }
}
