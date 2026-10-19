extern char data_ov002_022cf16c[];
extern char data_ov002_022cf178[];
extern char data_ov002_022cf17c[];
extern int func_0202eac8(int id);
extern unsigned int func_0202b8a8(int id);
extern int func_ov002_021c38c4(int player, int cat);
extern int func_ov002_021ca440(int arg0, int arg1);
extern void func_ov002_02253458(int player, int type, int idx);
struct Entry {
    unsigned int id:13;
    unsigned int flag:1;
    unsigned int unused:8;
    unsigned int category:8;
    unsigned int rest:2;
};
void func_ov002_0224f5fc(int player) {
    int offset = (player & 1) * 0x868;
    unsigned int i = 0;
    if (*(unsigned int *)(data_ov002_022cf178 + offset) > i) {
        int id;
        struct Entry *row;
        char *base = data_ov002_022cf16c + offset;
        row = (struct Entry *)(base + 0x120);
        do {
            id = row->id;
            if (func_0202eac8(id) != 0 &&
                func_ov002_021c38c4(player, row->category * 2 + row->flag) <= 4 &&
                func_ov002_021ca440(player, id) != 0) {
                func_ov002_02253458(player, 11, i);
            }
            i++;
            row++;
        } while (i < *(unsigned int *)(base + 0xc));
    }
    i = 0;
    if (*(unsigned int *)(data_ov002_022cf17c + offset) > i) {
        struct Entry *row;
        char *base = data_ov002_022cf16c + offset;
        int id;
        row = (struct Entry *)(base + 0x260);
        do {
            id = row->id;
            if (func_0202eac8(id) != 0 &&
                (int)func_0202b8a8(id) <= 4 &&
                func_ov002_021ca440(player, id) != 0) {
                func_ov002_02253458(player, 13, i);
            }
            i++;
            row++;
        } while (i < *(unsigned int *)(base + 0x10));
    }
}

