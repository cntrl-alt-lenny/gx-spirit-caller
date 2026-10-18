typedef struct {
    unsigned short a;
    unsigned short side : 1;
} Card;
typedef struct {
    char pad[0x30];
    unsigned int id : 13;
    unsigned int rest : 19;
    unsigned short h34;
    unsigned short h36;
    unsigned short h38;
} Row;
extern char data_ov002_022cf16c[];
extern void func_ov002_02280a1c(int side, int *out1, int *out2, int flag);
extern void func_ov002_021c4c9c(int side, int index, int *out);
int func_ov002_02291bfc(Card *card) {
    int out[11];
    int limit;
    int unused;
    int i;
    func_ov002_02280a1c(card->side, &limit, &unused, 1);
    for (i = 0; i <= 4; i++) {
        int side = 1 - card->side;
        Row *row = (Row *)(data_ov002_022cf16c + (side & 1) * 0x868 + i * 0x14);
        if (row->id != 0 && row->h38 != 0) {
            func_ov002_021c4c9c(side, i, out);
            if (((Row *)(data_ov002_022cf16c + ((1 - card->side) & 1) * 0x868 + i * 0x14))->h36 != 0) {
                if (out[6] > limit && out[5] < limit) return 1;
            } else {
                if (out[5] > limit && out[6] < limit) return 1;
            }
        }
    }
    return 0;
}
