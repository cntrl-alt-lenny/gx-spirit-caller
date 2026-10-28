extern int func_0202e234(int x);
extern int func_ov002_021ca440(int arg0, int arg1);
extern int func_ov002_021b3fd8(int arg0, int arg1, int arg2, int arg3);
extern void func_ov002_02253458(int player, int kind, int idx);
struct Count { unsigned int count; char pad[0x864]; };
extern struct Count data_ov002_022cf17c[];
extern char data_ov002_022cf16c[];
typedef struct {
    unsigned int id:13;
    unsigned int side:1;
    unsigned int pad:8;
    unsigned int slot:8;
    unsigned int pad2:2;
} Slot;
void func_ov002_0224b5b4(int player) {
    unsigned int i = 0;
    int offset = (player & 1) * 0x868;

    int id;
    Slot *row;
    char *base;
    if (data_ov002_022cf17c[player & 1].count <= i) return;
    base = data_ov002_022cf16c + offset;
    row = (Slot *)(base + 0x260);
    do {
        id = row->id;
        if (func_0202e234(id) != 0 && func_ov002_021ca440(player, id) != 0) {
            if (func_ov002_021b3fd8(player, 11, 0x12a1, row->slot * 2 + row->side) == 0) {
                func_ov002_02253458(player, 13, i);
            }
        }
        i++;
        row++;
    } while (i < *(unsigned int *)(base + 0x10));
}





