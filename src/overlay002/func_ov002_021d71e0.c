extern void *func_ov002_021c93f0(int player, int kind, int extra);
extern void func_ov002_021d479c(unsigned short a0, unsigned short a1, unsigned short a2, unsigned short a3);
extern void func_ov002_02244fe4(int a, unsigned int b);
typedef struct { unsigned int id:13; volatile unsigned int flag:1; unsigned int pad:8; unsigned int value:8; unsigned int rest:2; } Card;
void func_ov002_021d71e0(int player, int index, unsigned int flag) {
    Card *card = func_ov002_021c93f0(player, 11, index);
    int side = card->flag;
    int id = side + (card->value << 1);
    int enabled = !flag;
    func_ov002_021d479c(0x3f, ((id & 0x3ff) << 6) | ((player & 1) | 0x16), (side & 1) | 0x1a | (enabled << 6), 0);
    func_ov002_02244fe4(0x24, 0);
}








