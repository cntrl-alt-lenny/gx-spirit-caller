extern char data_ov002_022cf16c[];
extern char data_ov002_022cf180[];
extern unsigned int func_0202b890(int id);
extern int func_0202e234(int x);
extern int func_ov002_021b9128(int a, int b);
extern void func_ov002_02253458(int player, int kind, int idx);
struct Slot { unsigned id:13; unsigned rest:19; };
void func_ov002_0224aa14(int player, int card) {
    int idx = 0;
    struct Slot *row;
    char *base;
    int side = player & 1;
    if (*(unsigned int *)((unsigned int)data_ov002_022cf180 + 0x868 * side) <= idx) return;
    {
        base = (char *)((unsigned int)data_ov002_022cf16c + 0x868 * side);
        row = (struct Slot *)(data_ov002_022cf16c + 0x868 * side + 0x418);
        do {
            unsigned int id = row->id;
            unsigned int attr;
            if (func_0202e234(id) != 0) {
                attr = func_0202b890(card);
                if (func_ov002_021b9128(id, attr) != 0) {
                func_ov002_02253458(player, 14, idx);
            }
            }
            idx++;
            row++;
        } while (idx < *(unsigned int *)(base + 0x14));
    }
}














