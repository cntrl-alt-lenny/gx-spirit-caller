struct Ov002Ent {
    unsigned short id;
    unsigned short bit : 1;
    unsigned short rest : 15;
    unsigned short pad[4];
    unsigned short mode;
};

extern char data_ov002_022d016c[];
extern void func_ov002_021e276c(int a, unsigned short b, unsigned short c, int d);

int func_ov002_022315a8(struct Ov002Ent *p)
{
    switch (p->mode) {
    case 1: {
        unsigned int bit = p->bit;
        unsigned int cur = *(unsigned int *)(data_ov002_022d016c + 0xcec);
        unsigned char v = (bit != cur) + 1;
        func_ov002_021e276c(1 - bit, p->id, (unsigned short)((v << 4) | 1), 0);
        break;
    }
    case 2:
        func_ov002_021e276c(1 - p->bit, p->id, 1, 1);
        break;
    }
    return 0;
}
