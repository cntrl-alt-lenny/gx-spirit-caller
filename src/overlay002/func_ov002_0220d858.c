struct Card {
    unsigned short w0;
    unsigned short side : 1;
    unsigned short pad1 : 5;
    unsigned short kind : 6;
    unsigned short pad2 : 4;
    unsigned char pad3[16];
    unsigned int idx : 9;
    unsigned int f9 : 1;
    unsigned int pad4 : 5;
    unsigned int f15 : 1;
    unsigned int pad5 : 3;
    unsigned int nib : 4;
    unsigned int f23 : 1;
};

struct Slot {
    unsigned short id : 13;
    unsigned short pad : 3;
    unsigned short other;
};

extern struct Slot data_ov002_022d0250[];
extern int func_0202b878(int id);
extern int func_ov002_021bcfe4(int a, int b);

int func_ov002_0220d858(struct Card *c)
{
    int i;
    int n;
    if (c->kind == 0x16 || c->kind == 0x1b) {
        if (c->f9 == c->side && !c->f23 && c->f15 && c->nib == 0xe) {
            if (func_0202b878(data_ov002_022d0250[c->idx].id) == 9) {
                n = 0;
                for (i = 5; i < 10; i++) {
                    if (func_ov002_021bcfe4(1 - c->side, i) != 0)
                        n++;
                }
                return n >= 3;
            }
        }
    }
    return 0;
}
