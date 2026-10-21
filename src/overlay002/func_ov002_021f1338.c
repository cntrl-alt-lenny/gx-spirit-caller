typedef struct {
    unsigned short f0;
    unsigned short flag0 : 1;
    unsigned short field : 5;
    unsigned short : 10;
} Card021c1e44;
struct Slot { unsigned int id : 13; char pad[16]; };
struct HalfSlot { unsigned short value; char pad[18]; };
extern int func_ov002_021c1e44(Card021c1e44 *a0, int a1, int a2);
extern char data_ov002_022cf16c[];
extern char data_ov002_022cf1a4[];
extern char data_ov002_022cf1a2[];
int func_ov002_021f1338(Card021c1e44 *self, int player, int idx) {
    unsigned int id = ((struct Slot *)(data_ov002_022cf16c + (player & 1) * 0x868 + 0x30))[idx].id;
    if (idx >= 5) return 0;
    if (player != 1 - self->flag0) return 0;
    if (id == 0) return 0;
    if (((struct HalfSlot *)(data_ov002_022cf1a4 + (player & 1) * 0x868))[idx].value == 0) {
        if (((struct HalfSlot *)(data_ov002_022cf1a2 + (player & 1) * 0x868))[idx].value != 0) return 0;
    }
    if (func_ov002_021c1e44(self, player, idx) != 0) return 0;
    else return 1;
}



