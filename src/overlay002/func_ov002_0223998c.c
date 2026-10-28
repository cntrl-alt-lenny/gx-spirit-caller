typedef unsigned short u16;
typedef struct Card {
    u16 id;
    u16 side : 1;
    u16 index : 5;
    u16 unused2 : 8;
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
struct State { char pad[0x5a8]; int step; int count; };
struct Command { char pad[0xcec]; int side; };
struct Flag { char pad[0xb2]; u16 flag; };
extern struct State data_ov002_022ce288;
extern struct Command data_ov002_022d016c;
extern struct Flag data_ov002_022d0e6c;
extern int func_ov002_021df818(Card *card, int side, int amount);
extern void func_ov002_021e05fc(int side, int amount);
extern void func_ov002_021e2b3c(int unused0);
extern void func_ov002_021e2c5c(int unused0);
extern void func_ov002_0226b22c(int arg0, int arg1, int arg2, int arg3);
int func_ov002_0223998c(Card *card) {
    int side = data_ov002_022d016c.side ^ data_ov002_022ce288.count;
    switch (data_ov002_022ce288.step) {
    case 0x80:
        data_ov002_022ce288.count = 0;
        func_ov002_021e2b3c(0);
        return 0x7f;
    case 0x7f:
        func_ov002_0226b22c(side, side == card->side ? card->index : -1, 1, 1);
        return 0x7e;
    case 0x7e:
        if (data_ov002_022d0e6c.flag != 0)
            func_ov002_021e05fc(side, 2000);
        else
            func_ov002_021df818(card, side, 2000);
        return 0x7d;
    case 0x7d:
        if (++data_ov002_022ce288.count < 2) return 0x7f;
        func_ov002_021e2c5c(data_ov002_022ce288.count);
        return 0;
    }
    return 0;
}

