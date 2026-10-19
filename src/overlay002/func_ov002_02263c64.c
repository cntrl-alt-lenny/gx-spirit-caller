typedef struct { unsigned card:13; unsigned flag:1; unsigned pad:8; unsigned count:8; unsigned rest:2; } Card;
typedef struct { unsigned packed; unsigned pad; unsigned short value; char pad2[6]; unsigned flags; } Slot;
typedef struct { char pad[0x30]; Slot slots[5]; char tail[0x7d4]; } Bank;
typedef struct { char pad[0xd28]; unsigned index; } State;
extern char data_ov002_022cf16c[];
extern State data_ov002_022d016c;
extern int func_ov002_021b9ecc(int player, int slot);
extern int func_0202e2c8(int unused0);
extern int func_0202ed04(int id);
extern int func_ov002_021e30b4(int arg0, int arg1, int arg2);
int func_ov002_02263c64(int self, int arg) {
    unsigned i;
    for (i = data_ov002_022d016c.index; i < 10; i = ++data_ov002_022d016c.index) {
        int player;
        unsigned slot = i % 5;
        player = self ^ (i / 5);
        unsigned card;
        Bank *base = (Bank *)((player & 1) * 0x868 + (int)data_ov002_022cf16c);
        unsigned offset = slot * 20;
        char *p = (char *)base + 0x30;
        card = ((Card *)(p + offset))->card;
        int id = func_ov002_021b9ecc(player, slot);
        if (func_0202e2c8(card) && func_0202ed04(id)) {
            unsigned flags = *(unsigned *)((char *)base + offset + 0x40);
            unsigned value = *(unsigned short *)((char *)base + offset + 0x38);
            value &= ~((flags >> 6) & 1);
            if (value & ~(((flags >> 1) | (flags >> 2)) & 1)) {
                unsigned field;
                unsigned sign;
                Card *w = (Card *)(p + offset);
                unsigned short param;
                sign = player << 31;
                field = slot << 16;
                unsigned packed;
                sign &= 0x80000000;
                sign |= 0xa200000;
                field &= 0x1f0000;
                packed = (unsigned short)id | (sign | field);
                param = w->count * 2 + w->flag;
                if (func_ov002_021e30b4(packed, (unsigned short)param, arg)) {
                    ++data_ov002_022d016c.index;
                    return 0;
                }
            }
        }
    }
    return 1;
}











