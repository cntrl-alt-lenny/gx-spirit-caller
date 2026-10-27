typedef struct { unsigned short side:1, slot:5, index:8, rest:2; } Card;
typedef struct { char pad[0xc2]; short x,y,z; } Defaults;
extern Defaults data_ov002_022ccbdc;
extern short data_ov002_022ccc5c[][3];
extern char data_ov002_022d17f0[];
extern char data_ov002_022d1910[];
extern char data_ov002_022d1410[];
extern int data_ov002_022cd73c[];
/* Copy32's assembly definition has a dummy void list; its ABI takes three arguments. */
extern void Copy32(const void *, void *, unsigned int);
typedef union { Card b; unsigned short raw; } CardValue;
static inline void adjust(unsigned short *raw, int offset) { Card *c = (Card *)raw; c->index = (unsigned short)(c->index - offset); }
int func_ov002_022b867c(char *p, int side, int slot, int index, void *out)
{
    int v[3];
    CardValue c;
    if (slot < 0 || slot >= 16) {
        v[0] = data_ov002_022ccbdc.x;
        v[1] = data_ov002_022ccbdc.y;
        v[2] = data_ov002_022ccbdc.z;
        Copy32(v, out, 12);
        return 1;
    }
    v[0] = data_ov002_022ccc5c[slot][0];
    v[1] = data_ov002_022ccc5c[slot][1];
    v[2] = data_ov002_022ccc5c[slot][2];
    if (slot == 11) {
        char *q = data_ov002_022d17f0 + side * 0xcc;
        int n = *(int *)(q + 0xa4);
        c.raw = *(unsigned short *)(data_ov002_022d1910 + 0x90);
        if (n >= 8) n = 8;
        index -= *(int *)(q + 0xa8);
        if (n > 0) v[0] += (2 * index - (n - 1)) * 30;
        if (c.b.slot == 11 && side == c.b.side) {
            adjust(&c.raw, *(int *)(q + 0xa8));
            if (*(int *)(p + 0xd00 + (c.b.index % 3) * 4) != 0) {
                if (index < c.b.index) v[0] -= 8;
                else if (index > c.b.index) v[0] += 8;
            }
        }
    } else if ((unsigned)(slot - 12) <= 3) {
        char *q = data_ov002_022d1410;
        int n;
        if (slot < 12) q = 0;
        else q = q + 0x280 + side * 0xb0 + (slot - 12) * 0x2c;
        n = *(short *)(q + 0x2a);
        if (n > 40) n = 40;
        v[1] += n * 20 / 40;
    }
    if (side == (data_ov002_022cd73c[1] ^ 1)) {
        v[0] = -v[0];
        v[2] = -v[2];
    }
    Copy32(v, out, 12);
    return 1;
}



