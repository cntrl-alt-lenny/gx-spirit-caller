typedef struct {
    unsigned int id : 13;
    unsigned int flag : 1;
    unsigned int pad : 8;
    unsigned int kind : 8;
    unsigned int top : 2;
} Card;
typedef struct { char pad[0x1da2]; unsigned short ids[5]; } Global;
extern Global data_ov002_022cf16c;
typedef struct { unsigned int count; char pad[0x864]; } CountRow;
extern CountRow data_ov002_022cf17c[];
extern int func_ov002_021b3fd8(int arg0, int arg1, int arg2, int arg3);
extern void func_ov002_02253458(int player, int kind, int idx);
void func_ov002_0224958c(int player, int unused, int mode) {
    if (mode != 0) {
        int i;
        int other = 1 - player;
        char *base = (char *)&data_ov002_022cf16c + (other & 1) * 0x868;
        for (i = 0; i < 5; i++) {
            unsigned int j;
            for (j = 0; j < *(unsigned int *)(base + 0x10); j++) {
                if (data_ov002_022cf16c.ids[i] == ((Card *)(base + 0x260))[j].id) break;
            }
            func_ov002_02253458(other, 13, j);
        }
        return;
    }
    {
        Card *p;
        char *base;
        unsigned int i = 0;
        if (data_ov002_022cf17c[player & 1].count > i) {
            base = (char *)&data_ov002_022cf16c + 0x868 * (player & 1);
            p = (Card *)(base + 0x260);
            do {
                if (func_ov002_021b3fd8(player, 11, 0x12a1, p->kind * 2 + p->flag) == 0) {
                    func_ov002_02253458(player, 13, i);
                }
                i++;
                p++;
            } while (i < *(unsigned int *)(base + 0x10));
        }
    }
}










