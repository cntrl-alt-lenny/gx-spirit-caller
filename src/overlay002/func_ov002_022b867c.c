typedef union { struct { int x, y, z; }; short h[6]; } Vec;
typedef struct { unsigned short side:1, place:5, index:8, flags:2; } Selection;
typedef struct { char pad[0xa4]; int count, start; char rest[0x20]; } Row;
typedef struct { char pad[0x2a]; short value; } Card;
/* Copy32's assembly body consumes src, dst and byte count. */
extern void Copy32(const void *src, void *dst, unsigned size);
extern struct { char pad[0xc2]; short x, y, z; } data_ov002_022ccbdc;
extern short data_ov002_022ccc5c[][3];
extern Row data_ov002_022d17f0[];
extern char data_ov002_022d1910[];
extern struct { char pad[0x280]; Card cards[2][4]; } data_ov002_022d1410;
extern int data_ov002_022cd73c[];
static inline void Convert(short *src, Vec *dst) { dst->x = src[0]; dst->y = src[1]; dst->z = src[2]; }
static inline Card *GetCard(char *base, int side, int place) {
    if (place < 12) return 0;
    return (Card *)(base + 0x280 + side * 0xb0 + (place - 12) * 0x2c);
}
int func_ov002_022b867c(char *ctx, int side, int place, int index, Vec *out)
{
    Vec v;
    Selection sel;
    if (place < 0 || place >= 16) {
        v.x = data_ov002_022ccbdc.x;
        v.y = data_ov002_022ccbdc.y;
        v.z = data_ov002_022ccbdc.z;
        Copy32(&v, out, 12);
        return 1;
    }
    v.x = data_ov002_022ccc5c[place][0];
    v.y = data_ov002_022ccc5c[place][1];
    v.z = data_ov002_022ccc5c[place][2];
    if (place == 11) {
        Row *row = &data_ov002_022d17f0[side];
        int count = row->count;
        sel = *(Selection *)(data_ov002_022d1910 + 0x90);
        if (count >= 8) count = 8;
        index -= row->start;
        if (count > 0) v.x += (index * 2 - (count - 1)) * 30;
        if (sel.place == 11 && side == sel.side) {
            sel.index -= row->start;
            if (*(int *)(ctx + 0xd00 + (sel.index % 3) * 4) != 0) {
                if (index < sel.index) v.x -= 8;
                else if (index > sel.index) v.x += 8;
            }
        }
    } else if ((unsigned)(place - 12) <= 3) {
        Card *card;
        char *base = (char *)&data_ov002_022d1410;
        int value;
        if (place < 12) card = 0;
        else card = (Card *)(base + 0x280 + side * 0xb0 + (place - 12) * 0x2c);
        value = card->value;
        if (value > 40) value = 40;
        v.y += value * 20 / 40;
    }
    if (side == (data_ov002_022cd73c[1] ^ 1)) {
        v.x = -v.x;
        v.z = -v.z;
    }
    Copy32(&v, out, 12);
    return 1;
}




