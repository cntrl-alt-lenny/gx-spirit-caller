extern int data_ov002_022cf16c[];
extern int data_ov002_022cf180[];
extern int func_ov002_021bbd14(int, int);
extern int func_ov002_021c3ae4(int, int);

typedef struct {
    unsigned short a;
    unsigned short side : 1;
} Card;

int func_ov002_02291b44(Card *card) {
    int p = card->side;
    int off;
    if (*(unsigned *)((char *)data_ov002_022cf180 + ((1 - p) & 1) * 0x868) >= 5) {
        return 1;
    }
    if (func_ov002_021c3ae4(p, 0x14f0) != 0 || func_ov002_021bbd14(card->side, 0x14f0) != 0) {
        off = (card->side & 1) * 0x868;
        if (*(int *)((char *)data_ov002_022cf16c + off) > 0x3e8) {
            if (*(unsigned *)((char *)data_ov002_022cf180 + off) >= 15) {
                return 1;
            }
        }
    }
    return 0;
}
