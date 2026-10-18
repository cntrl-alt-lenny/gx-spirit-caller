typedef unsigned int u32;
typedef unsigned short u16;

struct Slot {
    u32 id : 13;
    u32 pad : 19;
    u32 rest[4];
};
struct Flag {
    u32 w0;
    u32 w1;
    u32 w2;
    u32 w3;
    u32 w4;
};
struct Cnt {
    u16 n;
    u16 pad[9];
};
struct Hdr {
    u16 w0;
    u16 side : 1;
    u16 rest : 15;
};

extern char data_ov002_022cf16c[];
extern char data_ov002_022cf1a4[];
extern char data_ov002_022cf1ac[];
extern int func_0202b878(int id);
extern int func_ov002_021c1ef0(void *a, int b, int c);

int func_ov002_021ee094(struct Hdr *a, u32 side, u32 slot) {
    u32 off = (side & 1) * 0x868;
    char *base = data_ov002_022cf16c + off;
    struct Slot *s = (struct Slot *)(base + 0x30) + slot;

    if (s->id == 0) {
        return 0;
    }
    if (side == a->side) {
        return 0;
    }
    if ((int)slot < 5 || (int)slot > 10) {
        return 0;
    }
    if ((((struct Flag *)(data_ov002_022cf1ac + off))[slot].w0 >> 9 & 1) == 0) {
        if (func_0202b878(s->id) == 0x17) {
            return 0;
        }
    }
    if (((struct Cnt *)(data_ov002_022cf1a4 + off))[slot].n == 0) {
        return 0;
    }
    return func_ov002_021c1ef0(a, side, slot) != 0;
}
