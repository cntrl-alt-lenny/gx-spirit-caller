typedef struct {
    unsigned short id;
    unsigned short side:1;
    unsigned short kind:5;
    unsigned short rest:10;
    unsigned short low:6;
    unsigned short value:9;
    unsigned short high:1;
} Card;
typedef struct {
    unsigned int id:13;
    unsigned int bit13:1;
    unsigned int pad:8;
    unsigned int value:8;
    unsigned int high:2;
} Slot;
extern char data_ov002_022cf16c[];
extern int func_ov002_021c2084(Card *card, int side, int slot, int check);
int func_ov002_021eecd8(Card *card, int side, int slot) {
    Slot *entry;
    int pos;
    int off;
    if (side != card->side) return 0;
    if (slot > 4) return 0;
    off = (side & 1) * 0x868;
    pos = slot * 0x14;
    entry = (Slot *)(off + (unsigned int)data_ov002_022cf16c + 0x30);
    if (((Slot *)((char *)entry + pos))->id == 0) return 0;
    if (((Slot *)((char *)entry + pos))->value * 2 + ((Slot *)((char *)entry + pos))->bit13 == card->value) return 0;
    return func_ov002_021c2084(card, side, slot, 0) != 0;
}
