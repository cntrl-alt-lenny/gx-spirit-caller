extern unsigned int func_0202b8a8(int id);
extern int func_02030808(int id);
extern int func_02030b84(int a0);
extern int func_ov002_021ca3f0(int arg0, int arg1);
extern void func_ov002_02253458(int player, int kind, int idx);
extern char data_ov002_022cf16c[];
struct CountRow { unsigned int count; char pad[0x864]; };
extern struct CountRow data_ov002_022cf184[];
struct Slot { unsigned int id:13; unsigned int rest:19; };
void func_ov002_0224c1e4(int player, int unused, unsigned int type)
{
    unsigned int i = 0;
    struct Slot *slot;
    char *row;
    if (data_ov002_022cf184[player & 1].count <= i) return;
    row = data_ov002_022cf16c + (player & 1) * 0x868;
    slot = (struct Slot *)(row + 0x3a0);
    do {
        int id = slot->id;
        if (type == func_0202b8a8(id) && func_02030808(id) != 0 && func_02030b84(id) != 0 && func_ov002_021ca3f0(player, id) != 0)
            func_ov002_02253458(player, 12, i);
        i++;
        slot++;
    } while (i < *(unsigned int *)(row + 0x18));
}
