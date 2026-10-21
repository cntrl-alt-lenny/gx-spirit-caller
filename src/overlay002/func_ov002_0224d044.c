extern int func_0202e234(int x);
extern int func_0202e42c(int x);
extern int func_ov002_021c33e4(int player, int side, int index);
extern void func_ov002_02253458(int player, int kind, int idx);
extern char data_ov002_022cf16c[];
struct CountRow { unsigned int count; char pad[0x864]; };
extern struct CountRow data_ov002_022cf180[];
struct Slot { unsigned int id:13; unsigned int rest:19; };
void func_ov002_0224d044(int player)
{
    unsigned int i = 0;
    struct Slot *slot;
    char *row;
    if (data_ov002_022cf180[player & 1].count <= i) return;
    row = data_ov002_022cf16c + (player & 1) * 0x868;
    slot = (struct Slot *)(row + 0x418);
    do {
        int id = slot->id;
        if (func_0202e234(id) != 0 && func_0202e42c(id) != 0 && func_ov002_021c33e4(player, player, i) != 0)
            func_ov002_02253458(player, 14, i);
        i++;
        slot++;
    } while (i < *(unsigned int *)(row + 0x14));
}

