extern int func_0202de9c(int unused0);
extern int func_0202e234(int x);
extern int func_ov002_021c33e4(int player, int side, int index);
extern void func_ov002_02253458(int player, int kind, int idx);
struct Count { unsigned int count; char pad[0x864]; };
extern struct Count data_ov002_022cf180[];
extern char data_ov002_022cf16c[];
struct Slot { unsigned int id:13; unsigned int rest:19; };
void func_ov002_0224b3b0(int player) {
    int b0 = player & 1;
    unsigned int i = 0;
    
    struct Slot *row; char *base;
    if (data_ov002_022cf180[b0].count <= i) return;
    base = data_ov002_022cf16c + 0x868 * b0;
    row = (struct Slot *)(base + 0x418);
    do {
        int id = row->id;
        if (func_0202e234(id) != 0 && func_0202de9c(id) == 0 && func_ov002_021c33e4(player, player, i) != 0) {
            func_ov002_02253458(player, 14, i);
        }
        i++;
        row++;
    } while (i < *(unsigned int *)(base + 0x14));
}





