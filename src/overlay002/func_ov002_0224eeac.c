typedef struct { unsigned int id:13; unsigned int rest:19; } Card;
extern char data_ov002_022cf16c[];
typedef struct { unsigned int count; char pad[0x864]; } Counts;
extern Counts data_ov002_022cf180[];
extern int func_ov002_0223b468(int key);
extern int func_ov002_0223b4c4(int key, int idx);
extern int func_0202df78(int a, int b);
extern int func_ov002_021c33e4(int a, int b, int c);
extern void func_ov002_02253458(int player, int kind, int idx);
void func_ov002_0224eeac(int player, int unused, int key) {
    int i;
    int j;
    int count;
    int id;
    Card *row;
    char *base;
    unsigned int offset;
    unsigned int side;
    count = func_ov002_0223b468(key);
    side = player & 1;
    offset = 0x868 * side;
    i = 0;
    if (data_ov002_022cf180[side].count > i) {
    base = data_ov002_022cf16c + offset;
    row = (Card *)(base + 0x418);
    do {
        id = row->id;
        for (j = 0; j < count; j++) {
            if (func_0202df78(func_ov002_0223b4c4(key, j), id) != 0) {
                if (func_ov002_021c33e4(player, player, i) != 0) {
                    func_ov002_02253458(player, 14, i);
                    break;
                }
            }
        }
        i++;
        row++;
    } while (i < *(unsigned int *)(base + 0x14));
}
}







