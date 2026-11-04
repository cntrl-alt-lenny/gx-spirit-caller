typedef struct {
    unsigned int id : 13;
    unsigned int flag : 1;
    unsigned int pad : 8;
    unsigned int kind : 8;
    unsigned int top : 2;
} Card;
typedef struct { unsigned int count; char pad[0x864]; } CountRow;
extern CountRow data_ov002_022cf17c[];
extern char data_ov002_022cf16c[];
extern unsigned int func_0202b890(int id);
extern int func_0202b950(int unused0);
extern int func_0202e234(int x);
extern int func_ov002_021ca440(int arg0, int arg1);
extern int func_ov002_021b3fd8(int arg0, int arg1, int arg2, int arg3);
extern void func_ov002_02253458(int player, int kind, int idx);
void func_ov002_02249818(int player, int card) {
    unsigned int i = 0;
    int id;
    Card *p;
    char *base;
    if (data_ov002_022cf17c[player & 1].count > i) {
        base = data_ov002_022cf16c + 0x868 * (player & 1);
        p = (Card *)(base + 0x260);
        do {
            id = p->id;
            if (func_0202e234(id) != 0 &&
                func_0202b950(id) <= 0x5dc &&
                func_0202b890(id) == func_0202b890(card) &&
                func_ov002_021ca440(player, id) != 0 &&
                func_ov002_021b3fd8(player, 11, 0x12a1, p->kind * 2 + p->flag) == 0) {
                func_ov002_02253458(player, 13, i);
            }
            i++;
            p++;
        } while (i < *(unsigned int *)(base + 0x10));
    }
}

