typedef struct { int x, y; } Point;
typedef struct { int pad; unsigned int low : 3; unsigned int offset : 2; unsigned int rest : 27; } Flags;
extern Flags data_02104f4c;
extern int data_ov002_022cd73c[];
extern const int data_ov002_022ca468[];
extern const int data_ov002_022ca470[];
extern void func_ov002_0229ea40(Point *out, int side, int type);
extern void func_ov002_0229ec04(Point *out, void *obj);
extern void func_ov002_0229dbc8(Point *out, void *s, int index);
void func_ov002_022a6e04(Point *out, char *tbl, int side, int kind, int extra) {
    Point p;
    int other = data_ov002_022cd73c[1] ^ 1;
    int me = side == other;
    int two = me * 2;
    int sgn = 1 - two;
    unsigned int flags;
    int n;
    switch (kind) {
    case 10:
        func_ov002_0229ea40(out, side, kind);
        return;
    case 12: case 13: case 14: case 15:
        func_ov002_0229ec04(out, kind < 12 ? 0 : tbl + 0x280 + side * 0xb0 + (kind - 12) * 0x2c);
        return;
    case 11:
        func_ov002_0229dbc8(out, tbl + 0x3e0 + side * 0xcc, extra);
        return;
    }
    n = kind + extra;
    if (n < 10) {
        int idx = side == other;
        p.x = data_ov002_022ca468[idx] + (n % 5) * (sgn * 28);
        p.y = data_ov002_022ca470[idx] + (n / 5) * (sgn * 29);
    } else if (kind <= 4) {
        int idx = side == other;
        p.x = data_ov002_022ca468[idx] + (kind % 5) * (sgn * 28);
        p.y = data_ov002_022ca470[idx];
    } else {
        p.x = 140;
        p.y = 104;
    }
    flags = data_02104f4c.offset;
    if (flags & 1) p.x -= 24;
    if (flags & 2) p.y -= 16;
    *out = p;
}
