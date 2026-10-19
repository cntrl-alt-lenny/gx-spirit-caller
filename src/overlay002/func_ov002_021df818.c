typedef unsigned short u16;
typedef struct Card {
    u16 id;
    u16 side : 1;
    u16 unused2 : 13;
    u16 flipped : 1;
    u16 unused3 : 1;
    u16 unused4 : 5;
    u16 active : 1;
    u16 unused5 : 10;
    u16 pad[9];
    u16 effect;
    u16 owner : 1;
    u16 unused6 : 15;
} Card;
extern int func_ov002_021df938(int, int, int, u16);
extern void func_ov002_0226ad5c(int, int, int, int);
int func_ov002_021df818(Card *card, int side, int amount) {
    if (card->active) {
        switch (card->effect) {
        case 0x156e:
            if (side == card->owner) {
                card->active = 0;
                return func_ov002_021df818(card, 1 - side, amount);
            }
            break;
        case 0x15a7:
            if (side == card->owner)
                return func_ov002_021df818(card, 1 - side, amount);
            break;
        case 0x15ab:
            if (side == card->owner) {
                func_ov002_0226ad5c(1 - side, 1, 0, (1 - side) != card->side);
                return 0;
            }
            break;
        case 0x198f:
            return 0;
        }
    }
    return func_ov002_021df938(side, amount, side != (card->side ^ card->flipped), card->id);
}

