typedef struct { unsigned short side:1, slot:5, index:8, rest:2; } Card;
typedef union { Card b; unsigned short raw; } CardValue;
typedef struct { char pad[0xa4]; int count, first; char tail[0x20]; } Player;
typedef struct { char pad[0x2a]; short amount; } Entry;
typedef struct { Entry entries[4]; } Row;
extern struct { char pad[0xc2]; short x, y, z; } data_ov002_022ccbdc;
extern short data_ov002_022ccc5c[][3];
extern Player data_ov002_022d17f0[];
extern char data_ov002_022d1910[];
extern char data_ov002_022d1410[];
extern int data_ov002_022cd73c[];
/* Copy32's assembly definition has no C parameters; its ABI takes three. */
extern void Copy32(const void *src, void *dst, unsigned size);
static inline void convert(int *dst, const short *src) {
    dst[0] = src[0]; dst[1] = src[1]; dst[2] = src[2];
}
static inline Entry *getEntry(char *base, int side, int slot) {
    Entry *entry = (Entry *)base;
    if (slot < 12) entry = 0;
    else entry = (Entry *)((char *)entry + 0x280 + side * 0xb0 + (slot - 12) * 0x2c);
    return entry;
}
int func_ov002_022b867c(char *self, int side, int slot, int index, int *out)
{
    struct { int x, y, z; } pos;
    CardValue card;
    int count;
    Player *player;
    if (slot < 0 || slot >= 16) {
        pos.x = data_ov002_022ccbdc.x;
        pos.y = data_ov002_022ccbdc.y;
        pos.z = data_ov002_022ccbdc.z;
        Copy32(&pos, out, 12);
        return 1;
    }
    pos.x = data_ov002_022ccc5c[slot][0];
    pos.y = data_ov002_022ccc5c[slot][1];
    pos.z = data_ov002_022ccc5c[slot][2];
    if (slot == 11) {
        player = &data_ov002_022d17f0[side];
        count = player->count;
        card.raw = *(unsigned short *)(data_ov002_022d1910 + 0x90);
        if (count >= 8) count = 8;
        index -= player->first;
        if (count > 0) pos.x += (index * 2 - (count - 1)) * 30;
        if (card.b.slot == 11 && side == card.b.side) {
            card.b.index -= player->first;
            if (*(int *)(self + 0xd00 + ((int)card.b.index % 3) * 4)) {
                if (index < card.b.index) pos.x -= 8;
                else if (index > card.b.index) pos.x += 8;
            }
        }
    } else {
        if ((unsigned)(slot - 12) <= 3) {
            Entry *entry;
            int value;
            entry = getEntry(data_ov002_022d1410, side, slot);
            value = entry->amount;
            if (value > 40) value = 40;
            pos.y += value * 20 / 40;

        }
    }
    if (side == (data_ov002_022cd73c[1] ^ 1)) {
        pos.x = -pos.x;
        pos.z = -pos.z;
    }
    Copy32(&pos, out, 12);
    return 1;
}



