extern unsigned int func_0202b8a8(int id);
extern int func_0202e234(int x);
extern int func_ov002_021ca440(int arg0, int arg1);
extern int func_ov002_021b3fd8(int arg0, int arg1, int arg2, int arg3);
extern void func_ov002_02253458(int player, int kind, int idx);
extern char data_ov002_022cf16c[];
struct CountRow { unsigned int count; char pad[0x864]; };
extern struct CountRow data_ov002_022cf17c[];
struct Slot { unsigned int id:13; unsigned int flag:1; unsigned int pad:8; unsigned int index:8; unsigned int tail:2; };
void func_ov002_0224c358(int player)
{
    unsigned int i = 0;
    int id;
    struct Slot *slot;
    char *row;
    if (data_ov002_022cf17c[player & 1].count <= i) return;
    row = data_ov002_022cf16c + (player & 1) * 0x868;
    slot = (struct Slot *)(row + 0x260);
    do {
        id = slot->id;
        if (func_0202e234(id) != 0 && func_0202b8a8(id) == 4 && func_ov002_021ca440(player, id) != 0 && func_ov002_021b3fd8(player, 11, 0x12a1, slot->index * 2 + slot->flag) == 0)
            func_ov002_02253458(player, 13, i);
        i++;
        slot++;
    } while (i < *(unsigned int *)(row + 0x10));
}

