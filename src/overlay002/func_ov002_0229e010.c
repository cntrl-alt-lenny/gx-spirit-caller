struct State { char pad[0xa0]; int side, count, base; char pad2[8]; int phase; };
struct Point { int x, y; };
extern int data_ov002_022cd73c[];
extern void func_ov002_0229dbc8(struct Point *out, struct State *s, int index);
int func_ov002_0229e010(struct State *s, int x) {
    struct Point q, p;
    int base = s->base;
    int offset, index;
    func_ov002_0229dbc8(&p, s, base);
    q = p;
    if (s->side == (data_ov002_022cd73c[1] ^ 1))
        { offset = -(x - (q.x + 11)); index = offset / 22; }
    else
        { offset = x - (q.x - 11); index = offset / 22; }
    if (index >= (s->count > 8 ? 8 : s->count)) return s->count - 1;
    if (index < 0) index = 0;
    return base + index;
}




