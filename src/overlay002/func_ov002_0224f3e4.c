extern char data_ov002_022cf16c[];
struct CountRow { unsigned int count; char pad[0x864]; };
extern struct CountRow data_ov002_022cf180[];
extern void func_ov002_02253458(int player, int kind, int idx);
struct Entry {
    unsigned int id:13;
    unsigned int flag:1;
    unsigned int unused:8;
    unsigned int category:8;
    unsigned int unused2:2;
};
void func_ov002_0224f3e4(int player, int unused, int category) {
    int side = player & 1;
    unsigned int i = 0;
    unsigned int count = data_ov002_022cf180[side].count;
    if (i < count) {
        struct Entry *row;
        char *base = data_ov002_022cf16c + side * 0x868;
        row = (struct Entry *)(base + 0x418);
        do {
            if ((row->id == 0xfbe || row->id == 0x18c5) &&
                category != row->category * 2 + row->flag) {
                func_ov002_02253458(player, 14, i);
            }
            i++;
            row++;
        } while (i < *(unsigned int *)(base + 0x14));
    }
}
