typedef struct { int value; char pad[4]; char byte8; char pad9[13]; unsigned short flags; } State;
extern State data_ov002_022cd300;
extern int func_ov002_021bc68c(int self);
extern int func_ov002_02275860(int a0, int a1, int a2);
extern int func_ov002_02275938(int a0, int a1, int a2);
extern int func_ov002_02275a14(int player, int arg1, int arg2);

int func_ov002_0226d9e4(int player, int id) {
    int found;
    int count;
    int (*check)(int, int, int);
    int i;
    State *g = &data_ov002_022cd300;
    int val = g->value;
    val = (val & ~1) | (player & 1);
    val &= 0xff8000ff;
    val |= ((unsigned)id << 17) >> 9;
    g->value = val;
    g->flags |= 2;
    g->byte8 = 0;
    found = 0;
    switch (id) {
    case 0x19a3:
        check = func_ov002_02275860;
        count = 3;
        break;
    case 0x19a4:
        check = func_ov002_02275938;
        count = 3;
        break;
    case 0x19c8:
        check = func_ov002_02275a14;
        count = 2;
        break;
    }
    for (i = 0; i <= 10; i++) {
        if (check(player, i, 0) != 0) {
            if (i <= 4) found = 1;
            count--;
        }
    }
    if (count > 0) return 0;
    if (found == 0) {
        if (func_ov002_021bc68c(player) == 0) return 0;
    }
    return 1;
}


