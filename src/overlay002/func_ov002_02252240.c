extern int func_0202e234(int x);
extern int func_0202ed90(int a0);
extern int func_ov002_021c33e4(int player, int side, int index);
extern void func_ov002_02253458(int player, int kind, int index);
extern char data_ov002_022cf16c[];
extern unsigned int data_ov002_022cf180[];
struct Slot {
    unsigned int id:13;
    unsigned int pad:6;
    unsigned int active:1;
    unsigned int disabled:1;
    unsigned int rest:11;
};
void func_ov002_02252240(int player) {
    unsigned int i;
    struct Slot *row2;
    char *base2;
    struct Slot *row;
    char *base;
    int other;
    unsigned int j;
    int side = player & 1;
    unsigned int count = *(unsigned int *)((char *)data_ov002_022cf180 + side * 0x868);
    i = 0;
    if (i < count) {
        row = (struct Slot *)(data_ov002_022cf16c + side * 0x868 + 0x418);
        base = data_ov002_022cf16c + side * 0x868;
        do {
            int id = row->id;
            if (func_0202e234(id) != 0 && func_0202ed90(id) != 0 && row->disabled == 0 && row->active != 0 && func_ov002_021c33e4(player, player, i) != 0) {
                func_ov002_02253458(player, 14, i);
            }
            i++;
            row++;
        } while (i < *(unsigned int *)(base + 0x14));
    }
    other = 1 - player;
    side = other & 1;
    count = *(unsigned int *)((char *)data_ov002_022cf180 + side * 0x868);
    j = 0;
    if (j < count) {
        base2 = data_ov002_022cf16c + side * 0x868;
        row2 = (struct Slot *)(base2 + 0x418);
        do {
            int id = row2->id;
            if (func_0202e234(id) != 0 && func_0202ed90(id) != 0 && row2->disabled == 0 && row2->active != 0 && func_ov002_021c33e4(player, other, j) != 0) {
                func_ov002_02253458(other, 14, j);
            }
            j++;
            row2++;
        } while (j < *(unsigned int *)(base2 + 0x14));
    }
}





