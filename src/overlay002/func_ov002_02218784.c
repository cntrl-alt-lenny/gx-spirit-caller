typedef unsigned short u16;
typedef struct Card {
    u16 id;
    u16 side : 1;
    u16 unused2 : 13;
    u16 flipped : 1;
    u16 unused3 : 1;
    u16 unused4 : 2;
    u16 blocked : 1;
    u16 unused7 : 2;
    u16 active : 1;
    u16 unused5 : 10;
    u16 pad[9];
    u16 effect;
    u16 owner : 1;
    u16 unused6 : 15;
} Card;
extern int func_ov002_021df818(Card *card, int side, int amount);
extern int func_ov002_021c2f24(int side, int id);
extern void func_ov002_021e05fc(int side, int amount);
int func_ov002_02218784(Card *card) {
    int i;
    if (card->blocked) return 0;
    switch (card->id) {
    case 0x1352:
        func_ov002_021e05fc(card->side, 1000);
        for (i = 0; i < func_ov002_021c2f24(card->side, card->id); i++) {
            func_ov002_021e05fc(card->side, 500);
        }
        break;
    case 0x135a:
        func_ov002_021df818(card, 1 - card->side, 700);
        for (i = 0; i < func_ov002_021c2f24(card->side, card->id); i++) {
            func_ov002_021df818(card, 1 - card->side, 300);
        }
        break;
    }
    return 0;
}

