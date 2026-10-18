typedef struct {
    unsigned int pad0 : 13;
    unsigned int lo : 1;
    unsigned int pad1 : 8;
    unsigned int hi : 8;
    unsigned int pad2 : 2;
    int w1, w2, w3, w4;
} Slot;

extern int data_ov002_022cf17c[];
extern int data_ov002_022cf178[];
extern char data_ov002_022cf16c[];
extern int data_ov002_022d016c[];
extern int func_ov002_021bae7c(int a, int b, int c);
extern int func_ov002_021bbeac(int side);

typedef struct {
    unsigned short h0;
    unsigned short side : 1;
    unsigned short idx : 5;
    unsigned short rest : 10;
    unsigned short pad : 6;
    unsigned short val : 9;
    unsigned short rest2 : 1;
} Arg;

int func_ov002_0220ab78(Arg *p) {
    unsigned int side = p->side;
    unsigned int off = (side & 1) * 0x868;
    if (*(unsigned int *)((char *)data_ov002_022cf17c + off) < 2) return 0;
    if (data_ov002_022d016c[0xcf8 / 4] != 0) {
        if (func_ov002_021bae7c(1 - side, 0x178b, -1) != 0) return 0;
    }
    {
        unsigned int s2 = p->side;
        unsigned int off2 = (s2 & 1) * 0x868;
        Slot *s;
        int r;
        if (*(int *)((char *)data_ov002_022cf178 + off2) != 0) return 0;
        s = (Slot *)(data_ov002_022cf16c + off2 + 0x30 + p->idx * 0x14);
        r = func_ov002_021bbeac(s2);
        return r == (s->lo + (s->hi << 1) == p->val);
    }
}
