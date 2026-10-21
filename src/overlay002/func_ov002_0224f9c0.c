struct Ov002Slot { unsigned int id : 13; };
extern char data_ov002_022cf16c[];
extern unsigned int data_ov002_022cf17c[];
extern int func_0202e234(int x);
extern unsigned int func_0202b8a8(int id);
extern int func_ov002_021ca440(int arg0, int arg1);
extern void func_ov002_02253458(int player, int kind, int idx);

void func_ov002_0224f9c0(int player) {
    unsigned int i = 0;
    unsigned int count = *(unsigned int *)((char *)data_ov002_022cf17c + (player & 1) * 0x868);
    if (i < count) {
        struct Ov002Slot *row = (struct Ov002Slot *)(data_ov002_022cf16c + (player & 1) * 0x868 + 0x260);
        char *base = data_ov002_022cf16c + (player & 1) * 0x868;
        do {
            int id = row->id;
            if (func_0202e234(id) != 0) {
                if (func_0202b8a8(id) == 4) {
                    if (func_ov002_021ca440(player, id) != 0) {
                        func_ov002_02253458(player, 13, i);
                    }
                }
            }
            i++;
            row++;
        } while (i < *(unsigned int *)(base + 0x10));
    }
}

