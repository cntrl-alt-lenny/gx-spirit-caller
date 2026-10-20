typedef unsigned int u32;
struct Slot { u32 id:13; u32 flag:1; u32 pad:8; u32 index:8; u32 rest:2; };
extern char data_ov002_022cf16c[];
extern char data_ov002_022cf178[];
extern char data_ov002_022cf17c[];
extern unsigned int func_0202b878(int id);
extern unsigned int func_0202b8a8(int id);
extern unsigned int func_ov002_021c38c4(int player, int index);
extern int func_ov002_021ca440(int arg0, int arg1);
extern int func_ov002_021b3fd8(int arg0, int arg1, int arg2, int arg3);
extern void func_ov002_02253458(int player, int kind, int index);
void func_ov002_0224dc24(int player, int unused, unsigned int limit) {
    int offset = (player & 1) * 0x868;
    unsigned int i = 0;
    if (i < *(unsigned int *)(data_ov002_022cf178 + offset)) {
        int id;
        struct Slot *row;
        char *base = data_ov002_022cf16c + offset;
        row = (struct Slot *)(base + 0x120);
        do {
            id = row->id;
            unsigned int type = func_0202b878(id);
            if (type == 10 || type == 11 || type == 16) {
                if (func_ov002_021c38c4(player, row->index * 2 + row->flag) <= limit) {
                    if (func_ov002_021ca440(player, id) != 0) {
                        if (func_ov002_021b3fd8(player, 11, 0x12a1, row->index * 2 + row->flag) == 0) {
                            func_ov002_02253458(player, 11, i);
                        }
                    }
                }
            }
            i++;
            row++;
        } while (i < *(unsigned int *)(base + 0xc));
    }
    i = 0;
    if (i < *(unsigned int *)(data_ov002_022cf17c + offset)) {
        int id;
        struct Slot *row;
        char *base = data_ov002_022cf16c + offset;
        row = (struct Slot *)(base + 0x260);
        do {
            id = row->id;
            unsigned int type = func_0202b878(id);
            if (type == 10 || type == 11 || type == 16) {
                if (func_0202b8a8(id) <= limit) {
                    if (func_ov002_021ca440(player, id) != 0) {
                        if (func_ov002_021b3fd8(player, 11, 0x12a1, row->index * 2 + row->flag) == 0) {
                            func_ov002_02253458(player, 13, i);
                        }
                    }
                }
            }
            i++;
            row++;
        } while (i < *(unsigned int *)(base + 0x10));
    }
}


