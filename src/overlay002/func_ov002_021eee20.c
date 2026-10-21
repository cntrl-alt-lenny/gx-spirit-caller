typedef struct {
    unsigned short id;
    unsigned short side:1;
    unsigned short rest:15;
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
typedef struct { Slot slot; char pad[16]; } Entry;
typedef struct { char pad[0x30]; Entry entries[5]; char tail[0x7d4]; } Row;
extern char data_ov002_022cf16c[];
extern int func_ov002_021c1ef0(Card *card, int side, int slot);
int func_ov002_021eee20(Card *card, int side, int slot) {
    Slot *entry;
    int pos;
    int off;
    if (slot > 4) return 0;
    pos = slot * 0x14;
    off = (side & 1) * 0x868;
    entry = (Slot *)(off + (unsigned int)data_ov002_022cf16c + 0x30);
    if (((Slot *)((char *)entry + pos))->id == 0) return 0;
    if (((Slot *)((char *)entry + pos))->value * 2 + ((Slot *)((char *)entry + pos))->bit13 == card->value) return 0;
    return func_ov002_021c1ef0(card, side, slot) != 0;
}


















