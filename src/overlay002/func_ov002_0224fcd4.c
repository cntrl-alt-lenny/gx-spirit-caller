struct Slot { unsigned int id : 13; };
extern char data_ov002_022cf16c[];
extern char data_ov002_022cf184[];
extern unsigned int func_0202b878(int id);
extern int func_ov002_021ca3f0(int arg0, int arg1);
extern int func_ov002_0223c918(int a, int b);
extern void func_ov002_02253458(int player, int kind, int idx);
extern void func_ov002_0224fb58(int player, int unused, int mode);
void func_ov002_0224fcd4(int player, int unused, int mode) {
    if (mode == 0) {
        unsigned int i = 0;
        if (i < *(unsigned int *)(data_ov002_022cf184 + (player & 1) * 0x868)) {
            struct Slot *row = (struct Slot *)(data_ov002_022cf16c + (player & 1) * 0x868 + 0x3a0);
            char *base = data_ov002_022cf16c + (player & 1) * 0x868;
            do {
                int id = row->id;
                if (func_0202b878(id) == 1 && func_ov002_021ca3f0(player, id) != 0 && func_ov002_0223c918(player, id) != 0) {
                    func_ov002_02253458(player, 12, i);
                }
                i++;
                row++;
            } while (i < *(unsigned int *)(base + 0x18));
        }
    } else {
        func_ov002_0224fb58(player, unused, mode);
    }
}
