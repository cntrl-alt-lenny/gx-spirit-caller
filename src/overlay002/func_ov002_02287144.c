struct Card {
    unsigned short pad0;
    unsigned short player : 1;
    unsigned short rest : 15;
};
struct State {
    char pad[0xcec];
    int player;
    char padcf0[8];
    int active;
};
extern struct State data_ov002_022d016c;
extern int func_ov002_02280980(int arg0);
extern int func_ov002_021bc0d4(unsigned int player, int a, int b);
int func_ov002_02287144(struct Card *p)
{
    if (data_ov002_022d016c.player == 1 - p->player && data_ov002_022d016c.active == 0) {
        if (func_ov002_02280980(p->player) <= 0) {
            if (func_ov002_021bc0d4(1 - p->player, 1, 1)) return 1;
        }
        return 0;
    }
    return 0;
}
