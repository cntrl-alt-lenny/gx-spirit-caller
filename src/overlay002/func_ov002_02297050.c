struct Card97050 {
    unsigned short id;
    unsigned short player : 1;
    unsigned short unused : 11;
    unsigned short state : 2;
    unsigned short rest : 2;
};
extern unsigned int func_0202b878(int id);
extern int func_ov002_021bae7c(int player, int id, int except);
extern int func_ov002_021bb068(int id);
extern int func_ov002_021feb08(struct Card97050 *card);
int func_ov002_02297050(struct Card97050 *card) {
    if (func_0202b878(card->id) == 0x16) {
        if (func_ov002_021bae7c(1 - card->player, 0x17d4, -1)) return 1;
        if (card->state == 0) {
            if (func_ov002_021bb068(0x171d)) return 1;
        }
    } else if (func_0202b878(card->id) == 0x17) {
        if (func_ov002_021bae7c(1 - card->player, 0x17c6, -1)) return 1;
        if (card->state == 0) {
            if (func_ov002_021bb068(0x184f)) return 1;
        }
    } else {
        if (func_ov002_021bae7c(card->player, 0x1771, -1)) return 1;
    }
    return func_ov002_021feb08(card);
}
