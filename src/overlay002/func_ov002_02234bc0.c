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
struct State { char pad[0xd0]; unsigned int flags; };
struct Positions { int side0; int side1; int pad[5]; int pos0; int pos1; };
extern struct State data_ov002_022d016c;
extern struct Positions data_ov002_022cd3f4;
extern int func_ov002_021de408(int a, int b);
extern int func_ov002_021df818(Card *card, int side, int amount);
extern void func_ov002_021e2b3c(int unused0);
extern void func_ov002_021e2c5c(int unused0);
int func_ov002_02234bc0(Card *card) {
    unsigned int flags = data_ov002_022d016c.flags;
    int mask = 0;
    int result;
    if (flags & 1) return 0;
    flags >>= 1;
    if (!(flags & 1)) return 0;
    func_ov002_021e2b3c(flags);
    mask |= 1 << (data_ov002_022cd3f4.pos0 + (data_ov002_022cd3f4.side0 << 4));
    mask |= 1 << (data_ov002_022cd3f4.pos1 + (data_ov002_022cd3f4.side1 << 4));
    func_ov002_021de408((int)card, mask);
    result = func_ov002_021df818(card, 1 - card->side, 0x320);
    func_ov002_021e2c5c(result);
    return 0;
}
