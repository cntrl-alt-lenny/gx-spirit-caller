typedef struct {
    unsigned short id;
    unsigned short side:1;
    unsigned short kind:5;
    unsigned short rest:10;
} Card;
struct Row { unsigned int id:13; unsigned int rest:19; char pad[16]; };
extern char data_ov002_022cf16c[];
extern char data_ov002_022cf1a4[];
extern int func_ov002_021b8fcc(int a0, int a1);
extern int func_ov002_021c1ef0(Card *card, int side, int slot);
extern int func_ov002_021c2084(Card *card, int side, int slot, int check);
int func_ov002_021ea044(Card *card, int side, int slot) {
    int off, pos;
    if (slot < 5) {
        if (func_ov002_021b8fcc(side, slot) == 0) return 0;
    }
    off = (side & 1) * 0x868;
    pos = slot * 20;
    if (((struct Row *)(data_ov002_022cf16c + off + 0x30))[slot].id == 0) return 0;
    if (*(unsigned short *)(data_ov002_022cf1a4 + off + pos) != 0) return 0;
    if (func_ov002_021c1ef0(card, side, slot) == 0) return 0;
    return func_ov002_021c2084(card, side, slot, 0) != 0;
}







