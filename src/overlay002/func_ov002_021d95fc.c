typedef unsigned int u32;
typedef unsigned short u16;
typedef struct { u32 id:13; u32 rest:19; } Card;
extern char data_ov002_022cf16c[];
extern char data_ov002_022d016c[];
extern void func_ov002_021d479c(u16 a0, u16 a1, u16 a2, u16 a3);
extern int func_ov002_021bd6c8(int arg0);
extern int func_0202df78(int a, int b);
extern int func_ov002_021de480(int arg0, int arg1, int arg2, int arg3);
void func_ov002_021d95fc(int a)
{
    int player, j, i;
    Card *card;
    char *p;
    func_ov002_021d479c(0x14, a, 1, 0);
    if (func_ov002_021bd6c8(0x10f4) == 0) return;
    if (func_0202df78(a, 0x10f4) != 0) return;
    for (i = 0; i < 2; i++) {
        player = *(int *)(data_ov002_022d016c + 0xcec) ^ i;
        card = (Card *)(data_ov002_022cf16c + (player & 1) * 0x868 + 0x94);
        p = data_ov002_022cf16c + (player & 1) * 0x868 + 0x64;
        for (j = 5; j <= 10; j++, card = (Card *)((char *)card + 0x14), p += 0x14) {
            if (card->id == 0x13f7 && *(u16 *)(p + 0x38) != 0 && !((*(u32 *)(p + 0x40) >> 6) & 1)) {
                func_ov002_021de480(player, j, 0, 0);
            }
        }
    }
}

