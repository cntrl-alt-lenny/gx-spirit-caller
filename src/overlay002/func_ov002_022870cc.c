struct Card {
    unsigned short pad0;
    unsigned short player : 1;
    unsigned short rest : 15;
    char pad4[0x10];
    unsigned int value : 16;
    unsigned int rest14 : 16;
};
struct Player {
    int value;
    char pad[0x864];
};
extern struct Player data_ov002_022cf16c[];
extern int func_ov002_0227da98(int arg0);
int func_ov002_022870cc(struct Card *p)
{
    if (func_ov002_0227da98(p->player) >= 2) return 1;
    if (data_ov002_022cf16c[p->player & 1].value <= 1000 || p->value >= 0x5dc) return 1;
    return 0;
}
