typedef struct { unsigned short id; unsigned short side:1; unsigned short rest:15; } Card;
typedef struct { unsigned short f0; unsigned short flag0:1; unsigned short field:5; unsigned short :10; } Card021c1e44;
typedef struct { unsigned int id:13; unsigned int rest:19; char pad[0x10]; } Slot;
extern char data_ov002_022cf16c[];
extern char data_ov002_022cf1a4[];
extern int func_ov002_021c1ef0(Card *card, int side, int slot);
extern int func_ov002_021c1e44(Card021c1e44 *a0, int a1, int a2);
int func_ov002_021e97bc(void *self, int player, int idx) {
    int off;
    int pos;
    if (idx >= 5) return 0;
    off = (player & 1) * 0x868;
    pos = idx * 0x14;
    if (((Slot *)(data_ov002_022cf16c + off + 0x30))[idx].id == 0) return 0;
    if (*(unsigned short *)(data_ov002_022cf1a4 + off + pos) == 0) return 0;
    if (func_ov002_021c1ef0(self, player, idx) == 0) return 0;
    return func_ov002_021c1e44(self, player, idx) == 0;
}





