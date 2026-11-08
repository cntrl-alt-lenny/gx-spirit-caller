typedef struct {
    unsigned short f0;
    unsigned short flag0:1;
    unsigned short field:5;
    unsigned short :10;
    unsigned short :6;
    unsigned short target:9;
    unsigned short :1;
    unsigned short f6, f8, fa;
} Card021c1e44;
typedef struct {
    unsigned int id:13;
    unsigned int side:1;
    unsigned int :8;
    unsigned int index:8;
    unsigned int :2;
    char padding[16];
} Slot;
typedef struct { char header[0x30]; Slot slots[11]; char tail[0x75c]; } Row;
extern char data_ov002_022cf16c[];
extern int func_ov002_021ecbd0(Card021c1e44 *self, int player, int idx);
extern int func_ov002_021c23ac(int player, int index);
typedef int (*Callback02257888)(void *self, int player, int idx);
extern int func_ov002_02257888(void *self, Callback02257888 fn, int target);
int func_ov002_021f2628(Card021c1e44 *self, int player, int idx) {
    Slot *slot;
    unsigned int row; int off;
    if (self->fa != 0) return func_ov002_021ecbd0(self, player, idx);
    if (self->flag0 != player) return 0;
    off = idx * 20;
    row = (player & 1) * 0x868;
    slot = (Slot *)(row + (unsigned int)data_ov002_022cf16c + 0x30);
    if (((Slot *)((char *)slot + off))->id == 0) return 0;
    if ((((Slot *)((char *)slot + off))->index * 2 + ((Slot *)((char *)slot + off))->side) == self->target) return 0;
    if (func_ov002_021c23ac(player, idx) == 0) return 0;
    return func_ov002_02257888(self, (Callback02257888)func_ov002_021ecbd0, (unsigned short)((unsigned char)player | ((unsigned char)idx << 8))) != 0;
}
