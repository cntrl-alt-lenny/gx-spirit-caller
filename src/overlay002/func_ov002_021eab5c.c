typedef unsigned short u16;
typedef unsigned int u32;

typedef struct {
    u16 pad0;
    u16 side : 1;
    u16 rest2 : 15;
    u16 pad4;
    u16 lo6 : 8;
    u16 hi6 : 8;
    u16 w8;
} Obj;

typedef struct {
    u32 id : 13;
    u32 rest : 19;
} Bits;

extern char data_ov002_022cf16c[];
extern char data_ov002_022cf1a2[];
extern char data_ov002_022cf1a4[];
extern int func_ov002_021c8470(int, int);

int func_ov002_021eab5c(Obj *p, int a, int b) {
    int off;
    int off2;
    if (b >= 5) {
        return 0;
    }
    if (a == p->side) {
        return 0;
    }
    off = (a & 1) * 0x868;
    off2 = b * 0x14;
    if (((Bits *)(data_ov002_022cf16c + off + 0x30 + off2))->id == 0) {
        return 0;
    }
    if (*(u16 *)(data_ov002_022cf1a4 + off + off2) == 0) {
        return 0;
    }
    if (*(u16 *)(data_ov002_022cf1a2 + off + off2) != 0) {
        return 0;
    }
    if (p->hi6 != 0) {
        return p->w8 == func_ov002_021c8470(a, b);
    }
    return 1;
}
