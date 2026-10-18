struct Card {
    unsigned short pad0;
    unsigned short a : 1;
    unsigned short pad1 : 15;
};

struct Ent {
    unsigned int lo : 13;
    unsigned int pad : 19;
    unsigned int rest[4];
};

extern char data_ov002_022cf16c[];
extern unsigned short data_ov002_022cf1a4[];
extern unsigned short data_ov002_022cf1a2[];
extern int func_ov002_021c1ef0(void *self, int player, int idx);

int func_ov002_021f208c(struct Card *self, int player, int slot) {
    struct Ent *e;
    int side;
    int off;
    if (slot >= 5) return 0;
    if (player == self->a) return 0;
    side = (player & 1) * 0x868;
    off = slot * 20;
    e = (struct Ent *)((data_ov002_022cf16c + side + 0x30) + off);
    if (e->lo == 0) return 0;
    if (*(unsigned short *)((char *)data_ov002_022cf1a4 + side + off) == 0) return 0;
    if (*(unsigned short *)((char *)data_ov002_022cf1a2 + side + off) != 0) return 0;
    return func_ov002_021c1ef0(self, player, slot) != 0;
}
