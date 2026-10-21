typedef struct {
    unsigned short f0;
    unsigned short flag0 : 1;
    unsigned short field : 5;
    unsigned short : 10;
    unsigned short : 6;
    unsigned short identity : 9;
    unsigned short : 1;
} Card021c1e44;

struct Ov002Slot {
    unsigned int id : 13;
    unsigned int flag : 1;
    unsigned int : 8;
    unsigned int kind : 8;
    unsigned int : 2;

};
struct Ov002Player { char padding[0x30]; struct Ov002Slot slots[100]; char tail[0x68]; };
extern struct Ov002Player data_ov002_022cf16c[];
extern int func_ov002_021c1e44(Card021c1e44 *a0, int a1, int a2);

int func_ov002_021f175c(Card021c1e44 *self, int player, int idx)
{
    if (((struct Ov002Slot *)((char *)data_ov002_022cf16c + (player & 1) * 0x868 + 0x30 + idx * 0x14))->id == 0) return 0;
    if (((struct Ov002Slot *)((char *)data_ov002_022cf16c + (player & 1) * 0x868 + 0x30 + idx * 0x14))->kind * 2 + ((struct Ov002Slot *)((char *)data_ov002_022cf16c + (player & 1) * 0x868 + 0x30 + idx * 0x14))->flag == self->identity) return 0;
    return func_ov002_021c1e44(self, player, idx) == 0;
}
