extern unsigned int func_0202b878(int id);
extern unsigned int func_0202b8a8(int id);
extern int func_ov002_021c33e4(int a, int b, int c);
extern void func_ov002_02253458(int player, int kind, int idx);
struct Count { unsigned int count; char pad[0x864]; };
extern struct Count data_ov002_022cf180[];
extern char data_ov002_022cf16c[];
struct Slot { unsigned int id:13; unsigned int rest:19; };
void func_ov002_0224b2e0(int player, int unused, int kind) {
    int i = 0;
    int b0 = player & 1;
    int id;
    struct Slot *row;
    char *base;
    if (data_ov002_022cf180[b0].count <= i) return;
    base = data_ov002_022cf16c + 0x868 * b0;
    row = (struct Slot *)(base + 0x418);
    do {
        id = row->id;
        if (func_0202b878(id) == 17 && func_ov002_021c33e4(player, player, i) != 0) {
            if (kind == ((int)func_0202b8a8(id) >= 6 ? 6 : (int)func_0202b8a8(id))) {
                func_ov002_02253458(player, 14, i);
            }
        }
        i++;
        row++;
    } while (i < *(unsigned int *)(base + 0x14));
}




