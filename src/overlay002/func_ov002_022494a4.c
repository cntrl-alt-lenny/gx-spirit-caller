typedef struct {
    unsigned int id : 13;
    unsigned int flag : 1;
    unsigned int pad : 8;
    unsigned int kind : 8;
    unsigned int top : 2;
} Card;

extern char data_ov002_022cf16c[];
extern unsigned int data_ov002_022cf17c[];
extern int func_0202e234(int id);
extern int func_0202b950(int id);
extern int func_ov002_021ca440(int player, int id);
extern int func_ov002_021b3fd8(int a, int b, int c, int d);
extern int func_ov002_02253458(int a, int b, int c);

void func_ov002_022494a4(int player) {
    unsigned int i = 0;
    int off = (player & 1) * 0x868;
    int id;
    Card *p;
    char *row;
    if (*(unsigned int *)((char *)data_ov002_022cf17c + off) > i) {
        row = data_ov002_022cf16c + off;
        p = (Card *)(row + 0x260);
        do {
            id = p->id;
            if (func_0202e234(id) != 0 && func_0202b950(id) <= 0x5dc &&
                func_ov002_021ca440(player, id) != 0) {
                if (func_ov002_021b3fd8(player, 0xb, 0x12a1, p->kind * 2 + p->flag) == 0) {
                    func_ov002_02253458(player, 0xd, i);
                }
            }
            i++;
            p++;
        } while (i < *(unsigned int *)(row + 0x10));
    }
}
