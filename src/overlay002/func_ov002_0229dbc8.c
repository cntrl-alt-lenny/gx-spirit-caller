struct State { char pad[0xa0]; int side, count, base; char pad2[8]; int phase; };
struct Point { int x, y; };
struct Flags { unsigned int pad; unsigned int low:3; unsigned int offset:2; unsigned int rest:27; };
extern int data_ov002_022cd73c[];
extern int data_ov002_022ca398[];
extern int data_ov002_022ca390[];
extern struct Flags data_02104f4c;
void func_ov002_0229dbc8(struct Point *out, struct State *s, int index) {
    struct Point p;
    int step, n, current, side, other;
    current = data_ov002_022cd73c[1];
    side = s->side;
    other = current ^ 1;
    step = (1 - 2 * (side == other)) * 22;
    n = s->count;
    int v;
    unsigned int flags;
    if (n == 0) {
        p.x = 140;
    } else if (n <= 8) {
        p.x = 140 - ((n - 1) * step + (side == current)) / 2 + index * step;
    } else {
        int offset = index - s->base;
        int base;
        if (offset < -1) offset = -1;
        base = data_ov002_022ca398[side == other];
        if (offset >= 8) offset = 8;
        p.x = base + offset * step;
    }
    v = s->phase - 8;
    if (v < 0) v = -v;
    v = (8 - v) * 3;
    p.y = data_ov002_022ca390[side == other] + (side == other ? -v : v);
    flags = data_02104f4c.offset;
    if (flags & 1) p.x -= 24;
    if (flags & 2) p.y -= 16;
    *out = p;
}




