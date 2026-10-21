extern unsigned int func_0202b878(int id);
extern int func_0202b980(int unused0);
extern int func_0202e234(int x);
extern void func_ov002_02253458(int player, int kind, int idx);
extern char data_ov002_022cf16c[];
struct CountRow { unsigned int count; char pad[0x864]; };
extern struct CountRow data_ov002_022cf17c[];
struct Slot { unsigned int id:13; unsigned int rest:19; };
void func_ov002_0224c440(int player)
{
    unsigned int i = 0;
    struct Slot *slot;
    char *row;
    if (data_ov002_022cf17c[player & 1].count <= i) return;
    row = data_ov002_022cf16c + (player & 1) * 0x868;
    slot = (struct Slot *)(row + 0x260);
    do {
        int id = slot->id;
        if (func_0202e234(id) != 0 && func_0202b980(id) <= 0x4b0 && func_0202b878(id) == 2)
            func_ov002_02253458(player, 13, i);
        i++;
        slot++;
    } while (i < *(unsigned int *)(row + 0x10));
}
