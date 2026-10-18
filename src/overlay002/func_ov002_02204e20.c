typedef unsigned short u16;
typedef unsigned int u32;

typedef struct {
    u16 id;
    u16 side : 1;
    u16 rest : 15;
} Card;

typedef struct {
    u32 pad[3];
    u32 count;
    char rest[0x868 - 0x10];
} Slot;

extern Slot data_ov002_022cf16c[];
extern char data_ov002_022cf178[];

extern int func_ov002_021ff3bc(Card *c, int b);
extern int func_ov002_021bbf50(int a);
extern int func_ov002_021ff320(Card *c, int b);
extern int func_ov002_022536e8(int a, int b, int c);

int func_ov002_02204e20(Card *c, int b)
{
    u32 i;

    if (func_ov002_021ff3bc(c, b) == 0) {
        return 0;
    }
    if (func_ov002_021bbf50(c->side) != 0) {
        return 0;
    }
    if (func_ov002_021ff320(c, b) == 0) {
        return 0;
    }
    i = 0;
    if (i < *(u32 *)(data_ov002_022cf178 + (c->side & 1) * 0x868)) {
        do {
            if (func_ov002_022536e8(c->side, c->id, i) != 0) {
                return 1;
            }
            i++;
        } while (i < data_ov002_022cf16c[c->side & 1].count);
    }
    return 0;
}
