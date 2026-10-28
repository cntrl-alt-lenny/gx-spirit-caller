typedef struct {
    unsigned int id : 13;
    unsigned int rest : 19;
} Card;
extern char data_ov002_022cf16c[];
typedef struct { unsigned int count; char pad[0x864]; } CountRow;
extern CountRow data_ov002_022cf17c[];
extern int func_0202e234(int x);
extern void func_ov002_02253458(int player, int kind, int idx);
void func_ov002_022496b4(int player) {
    unsigned int i = 0;
    Card *p;
    char *base;
    if (data_ov002_022cf17c[player & 1].count > i) {
        base = data_ov002_022cf16c + 0x868 * (player & 1);
        p = (Card *)(base + 0x260);
        do {
            if (func_0202e234(p->id) == 0) {
                switch (p->id) {
                case 0x1497:
                case 0x1498:
                case 0x1499:
                case 0x149a:
                case 0x17ad:
                case 0x17ae:
                    break;
                default:
                    func_ov002_02253458(player, 13, i);
                    break;
                }
            }
            i++;
            p++;
        } while (i < *(unsigned int *)(base + 0x10));
    }
}




