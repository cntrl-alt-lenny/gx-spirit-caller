typedef unsigned short u16;
struct Ov002Self { u16 f0; u16 b0 : 1; };

typedef struct { char _pad[0x868]; } PlayerBlock021f6940;
extern PlayerBlock021f6940 data_ov002_022cf16c[];

typedef struct {
    char _pad[0x30];
    unsigned int id : 13;
} PadSlot021f6940;

int func_ov002_021f6940(struct Ov002Self *self, int player, int idx) {
    if (self->b0 != player)
        return 0;
    if (idx > 4)
        return 0;
    PadSlot021f6940 *slot = (PadSlot021f6940 *)((char *)&data_ov002_022cf16c[player & 1] + idx * 0x14);
    return slot->id != 0;
}
