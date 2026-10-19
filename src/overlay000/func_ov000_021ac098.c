struct Ov000Curve {
    unsigned : 6;
    unsigned x : 9;
    unsigned base : 9;
    unsigned width : 8;
    unsigned a : 8;
    unsigned b : 8;
    unsigned c : 8;
    unsigned : 8;
    unsigned lo : 16;
    unsigned hi : 16;
    unsigned margin : 8;
    unsigned : 24;
};
extern unsigned func_ov000_021abe64(struct Ov000Curve *p);
int func_ov000_021ac098(struct Ov000Curve *p, unsigned x, unsigned y) {
    int mid = func_ov000_021abe64(p);
    if (x >= p->x && x < p->x + p->width &&
        y >= p->base && y < p->base + p->a) {
        if (y < p->base + p->b) return 1;
        if ((int)y < mid) return 2;
        if (y < mid + p->c) return 3;
        if (y < p->base + p->a - p->b) return 4;
        return 5;
    }
    return -1;
}
