typedef struct {
    unsigned short pad;
    unsigned short side : 1;
    unsigned short rest : 15;
} Card;

extern char data_ov002_022cf16c[];
extern char data_ov002_022d016c[];

int func_ov002_02204ab8(Card *p)
{
    unsigned int idx = p->side;
    int v = *(int *)(data_ov002_022cf16c + (idx & 1) * 0x868);

    if (v > 1000) {
        return 0;
    }
    if (*(unsigned int *)(data_ov002_022d016c + 0xcec) == idx) {
        return 0;
    }
    return 2;
}
