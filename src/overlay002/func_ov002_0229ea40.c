typedef struct { int x, y; } Point;
typedef struct { int pad; unsigned int unused : 3; unsigned int flags : 2; unsigned int rest : 27; } State;
extern State data_02104f4c;
extern int data_ov002_022cd73c[];
extern int data_ov002_022ca3b8[];
extern int data_ov002_022ca3b0[];
extern int data_ov002_022ca3a8[];
extern Point data_ov002_022ca3c0[];
void func_ov002_0229ea40(Point *out, int side, int type) {
    Point p;
    unsigned int flags;
    switch (type) {
    case 10:
        p.x = data_ov002_022ca3b8[(side == (data_ov002_022cd73c[1] ^ 1)) ^ 1];
        p.y = data_ov002_022ca3b0[side == (data_ov002_022cd73c[1] ^ 1)] + data_ov002_022ca3a8[side == (data_ov002_022cd73c[1] ^ 1)];
        break;
    case 12:
        p.x = data_ov002_022ca3b8[(side == (data_ov002_022cd73c[1] ^ 1)) ^ 1];
        p.y = data_ov002_022ca3b0[side == (data_ov002_022cd73c[1] ^ 1)];
        break;
    case 13:
        p.x = data_ov002_022ca3b8[side == (data_ov002_022cd73c[1] ^ 1)];
        p.y = data_ov002_022ca3b0[side == (data_ov002_022cd73c[1] ^ 1)];
        break;
    case 14:
        p.x = data_ov002_022ca3b8[side == (data_ov002_022cd73c[1] ^ 1)];
        p.y = data_ov002_022ca3b0[side == (data_ov002_022cd73c[1] ^ 1)] + data_ov002_022ca3a8[side == (data_ov002_022cd73c[1] ^ 1)];
        break;
    case 15: {
        type = side == (data_ov002_022cd73c[1] ^ 1);
        Point *entry = &data_ov002_022ca3c0[type];
        p.x = entry->x;
        p.y = entry->y;
        break;
    }
    }
    flags = data_02104f4c.flags;
    if (flags & 1) p.x -= 24;
    if (flags & 2) p.y -= 16;
    *out = p;
}




