typedef unsigned short u16;
typedef unsigned int u32;
struct Card {
    u16 id;
    u16 player : 1;
    u16 slot : 5;
    u16 kind : 6;
    u16 mode : 2;
    u16 flag : 1;
    u16 unused : 1;
    u16 low : 6;
    u16 value : 9;
    u16 high : 1;
    u16 pad;
    u32 a, b, c, extra;
};
extern int func_ov002_021fd270(struct Card *, struct Card *);
int func_ov002_021fd81c(u32 packed, u16 value, int extra)
{
    struct Card card = {0};
    card.id = packed;
    card.player = (packed & 0x80000000) >> 31;
    card.flag = (u16)((packed & 0x1000000) >> 24);
    card.mode = (u16)((packed & 0xe00000) >> 21);
    card.slot = (u16)((packed & 0x1f0000) >> 16);
    card.kind = (u16)((packed & 0x7e000000) >> 25);
    card.value = value;
    card.extra = extra;
    return func_ov002_021fd270(&card, 0);
}


