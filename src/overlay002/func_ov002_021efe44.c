typedef struct {
    unsigned short f0;
    unsigned short flag0 : 1;
    unsigned short field : 5;
    unsigned short       : 10;
} Card021efe44;

typedef struct { unsigned int f0 : 13; unsigned int : 19; char _pad[0x10]; } SlotA;
typedef struct { unsigned short v; char _pad[0x12]; } SlotB;

extern char data_ov002_022cf16c[];
extern char data_ov002_022cf1a4[];

extern int func_ov002_021c1ef0(Card021efe44 *self, int player, int idx);
extern int func_ov002_021c1e44(Card021efe44 *self, int player, int idx);

int func_ov002_021efe44(Card021efe44 *self, int player, int idx)
{
    if (player != self->flag0) return 0;
    if (idx >= 5) return 0;
    {
        int po = (player & 1) * 0x868;
        if (((SlotA *)(data_ov002_022cf16c + po + 0x30))[idx].f0 == 0) return 0;
        if (((SlotB *)(data_ov002_022cf1a4 + po))[idx].v == 0) return 0;
    }
    if (func_ov002_021c1ef0(self, player, idx) == 0) return 0;
    return func_ov002_021c1e44(self, player, idx) == 0;
}
