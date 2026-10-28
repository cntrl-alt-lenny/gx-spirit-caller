typedef unsigned int u32;
typedef struct { u32 id:13; u32 side:1; u32 pad:8; u32 index:8; u32 rest:2; } Card;
extern unsigned char data_ov002_022cf16c[];
extern void func_ov002_02254a2c(int a);
extern int func_ov002_021bb068(int id);
extern int func_0202e2c8(int unused0);
extern unsigned int func_0202b878(int id);
extern void func_ov002_021d730c(int player, Card *card, int flags, int kind, int active, int mode);
extern void func_ov002_021e276c(void *self, int a, int b, int c);
void func_ov002_021d7a64(void *player, int index, int flag) {
    int kind = 14;
    Card *cards;
    func_ov002_02254a2c((int)player);
    if (flag != 0 && func_ov002_021bb068(0x19da) != 0) {
        if (func_0202e2c8(((Card *)(data_ov002_022cf16c + ((int)player & 1) * 0x868 + 0x120))[index].id) != 0)
            kind = 12;
        else
            kind = 13;
    }
    cards = (Card *)(data_ov002_022cf16c + ((int)player & 1) * 0x868 + 0x120);
    func_ov002_021d730c((int)player, &cards[index], 0x1000, kind, 0, 0);
    if (func_0202b878(cards[index].id) == 1)
        func_ov002_021e276c(player, 0x14e2, 2, 0);
}
