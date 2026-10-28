extern unsigned int func_0202b878(int id);
extern int func_0202e234(int x);
extern int func_ov002_021ba5e0(int idx);
extern int func_ov002_021ba654(unsigned int a, unsigned int b);
extern char data_ov002_022cf16c[];
struct CountRow { unsigned int count; char pad[0x864]; };
extern struct CountRow data_ov002_022cf180[];
struct Slot { unsigned int id : 13; };
int func_ov002_02281c90(unsigned int player) {
    unsigned int i;
    int a = 0;
    int b = 0;
    int c = 0;

    int id;
    struct Slot *entry;
    char *row;
    i = 0;
    if (data_ov002_022cf180[player & 1].count > i) {
        row = data_ov002_022cf16c + (player & 1) * 0x868;
        entry = (struct Slot *)(row + 0x418);
        do {
            id = entry->id;
            if (func_0202e234(id)) a++;
            else if (func_0202b878(id) == 22) b++;
            else c++;
            i++;
            entry++;
        } while (i < *(unsigned int *)(row + 0x14));
    }
    if (b > a && b >= c) {
        if (func_ov002_021ba654(player, 22)) return 1;
    }
    if (c > a || !func_ov002_021ba5e0(player)) return 2;
    return 0;
}






