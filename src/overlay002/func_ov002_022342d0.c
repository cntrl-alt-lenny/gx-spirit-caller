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
extern int func_ov002_021de408(int a, int b);
extern int func_ov002_021df818(Card *card, int side, int amount);
extern void func_ov002_021e2b3c(int unused0);
extern void func_ov002_021e2c5c(int unused0);
extern int func_ov002_02216180(Card *card, int arg1);
extern struct { char pad[0x5a8]; int state; int value; } data_ov002_022ce288;
int func_ov002_022342d0(Card *card, int arg1) {
    int result;
    if (data_ov002_022ce288.state != 0x78)
        return func_ov002_02216180(card, arg1);
    func_ov002_021e2b3c((int)card);
    func_ov002_021de408((int)card, data_ov002_022ce288.value);
    func_ov002_021df818(card, 1 - card->side, (unsigned)card->pad[1] >> 1);
    result = func_ov002_021df818(card, card->side, (unsigned)card->pad[1] >> 1);
    func_ov002_021e2c5c(result);
    return 0;
}

