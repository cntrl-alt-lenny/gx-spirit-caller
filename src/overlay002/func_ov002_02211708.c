struct Card {
    unsigned short w0;
    unsigned short side : 1;
    unsigned short pad1 : 15;
    unsigned short pad2;
    unsigned short cnt : 8;
    unsigned short pad3 : 8;
};

struct Side {
    unsigned char pad[0x418];
    int slots[1];
    unsigned char pad2[0x868 - 0x41c];
};

struct G {
    unsigned char pad[0x5a8];
    int mode;
};
extern struct G data_ov002_022ce288;
extern struct Side data_ov002_022cf16c[];
extern void func_ov002_021e2b3c(void);
extern void func_ov002_021e2c5c(void);
extern int func_ov002_0223def4(struct Card *c, int n);
extern int func_ov002_021b99b4(int side, int v);
extern void func_ov002_021d7d0c(struct Card *c, int side, int *p);

int func_ov002_02211708(struct Card *c)
{
    int r;
    switch (data_ov002_022ce288.mode) {
    case 0x80:
        func_ov002_021e2b3c();
    case 0x7f:
        if (c->cnt != 0) {
            r = func_ov002_0223def4(c, c->cnt - 1);
            r = func_ov002_021b99b4(c->side, r);
            if (r >= 0)
                func_ov002_021d7d0c(c, c->side, &data_ov002_022cf16c[c->side & 1].slots[r]);
            c->cnt = (unsigned short)(c->cnt + 0xffff);
            return 0x7f;
        }
        func_ov002_021e2c5c();
    }
    return 0;
}
