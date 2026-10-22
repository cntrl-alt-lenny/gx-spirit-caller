extern int func_0202e234(int x);
extern int func_0202ed90(int a0);
extern int func_ov002_021c33e4(int a, int b, int c);
extern void func_ov002_02253458(int player, int kind, int idx);
extern char data_ov002_022cf16c[];
struct SideCount { unsigned int count; char pad[0x864]; };
extern struct SideCount data_ov002_022cf180[];
struct Slot { unsigned int id:13; unsigned int rest:19; };
void func_ov002_022520f0(int player, int excluded) {
    unsigned int offset;
    unsigned int i;
    struct Slot *row;
    char *base;
    offset = (player & 1) * 0x868;
    unsigned int count = data_ov002_022cf180[player & 1].count;
    i = 0;
    if (i < count) {
        base = data_ov002_022cf16c + offset;
        row = (struct Slot *)(base + 0x418);
        do {
            int id = row->id;
            if (func_0202e234(id) != 0 && func_0202ed90(id) != 0 && id != excluded && func_ov002_021c33e4(player, player, i) != 0) {
                func_ov002_02253458(player, 14, i);
            }
            i++;
            row++;
        } while (i < *(unsigned int *)(base + 0x14));
    }
}







