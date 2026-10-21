extern char data_ov002_022cf16c[];
struct CountRow { unsigned int count; char pad[0x864]; };
extern struct CountRow data_ov002_022cf180[];
extern int func_0202e234(int x);
extern int func_0202ef08(int x);
extern int func_ov002_021c33e4(int player, int other, int idx);
extern void func_ov002_02253458(int player, int kind, int idx);
struct Entry { unsigned int id:13; };
void func_ov002_0224f548(int player) {
    int side = player & 1;
    unsigned int i = 0;
    unsigned int count = data_ov002_022cf180[side].count;
    if (i < count) {
        int id;
        struct Entry *row;
        char *base = data_ov002_022cf16c + side * 0x868;
        row = (struct Entry *)(base + 0x418);
        do {
            id = row->id;
            if (func_0202e234(id) != 0 &&
                func_0202ef08(id) != 0 &&
                func_ov002_021c33e4(player, player, i) != 0) {
                func_ov002_02253458(player, 14, i);
            }
            i++;
            row++;
        } while (i < *(unsigned int *)(base + 0x14));
    }
}







