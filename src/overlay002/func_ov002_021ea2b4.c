typedef struct {
    unsigned short id;
    unsigned short side:1;
    unsigned short kind:5;
    unsigned short rest:10;
    unsigned short pad4:6;
    unsigned short value:9;
    unsigned short rest4:1;
} Card;
struct Row {
    unsigned int id:13;
    unsigned int side:1;
    unsigned int pad:8;
    unsigned int value:8;
    unsigned int rest:2;
    char padding[16];
};
struct Table { char header[0x30]; struct Row rows[100]; char tail[104]; };
extern struct Table data_ov002_022cf16c[];
extern char data_ov002_022cf1a4[];
extern int func_ov002_021b8fcc(int a0, int a1);
extern int func_ov002_021c2084(Card *card, int side, int slot, int check);
int func_ov002_021ea2b4(Card *card, int side, int slot) {
    int off, pos;
    char *base;
    if (slot < 5) {
        if (func_ov002_021b8fcc(side, slot) == 0) return 0;
    }
    pos = slot * 20;
    off = (side & 1) * 0x868;
    if (data_ov002_022cf16c[side & 1].rows[slot].id == 0) return 0;
    if (*(unsigned short *)(data_ov002_022cf1a4 + off + pos) == 0) return 0;
    if ((data_ov002_022cf16c[side & 1].rows[slot].value * 2 + data_ov002_022cf16c[side & 1].rows[slot].side) == card->value) return 0;
    return func_ov002_021c2084(card, side, slot, 0) != 0;
}






