typedef struct { unsigned int id : 13; unsigned int rest : 19; } Card;
extern char data_ov002_022cf16c[];
extern unsigned int data_ov002_022cf180[];
extern int func_0202e234(int x);
extern int func_0202b950(int unused0);
extern int func_0202e270(int unused0);
extern void func_ov002_02253458(int player, int kind, int idx);
void func_ov002_02249cec(int player) {
    unsigned int i = 0;
    int off = (player & 1) * 0x868;
    int id;
    Card *p;
    char *row;
    if (*(unsigned int *)((char *)data_ov002_022cf180 + off) > i) {
        row = data_ov002_022cf16c + off;
        p = (Card *)(row + 0x418);
        do {
            id = p->id;
            if (func_0202e234(id) != 0 && func_0202b950(id) <= 0x5dc && func_0202e270(id) == 0) {
                func_ov002_02253458(player, 14, i);
            }
            i++;
            p++;
        } while (i < *(unsigned int *)(row + 0x14));
    }
}
