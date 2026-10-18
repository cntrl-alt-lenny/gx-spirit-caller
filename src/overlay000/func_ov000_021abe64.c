struct Ov000Curve {
    unsigned : 15;
    unsigned base : 9;
    unsigned : 8;
    unsigned a : 8;
    unsigned b : 8;
    unsigned c : 8;
    unsigned : 8;
    unsigned lo : 16;
    unsigned hi : 16;
    unsigned margin : 8;
    unsigned : 24;
};
extern unsigned func_020b3a7c(unsigned, unsigned);
unsigned func_ov000_021abe64(struct Ov000Curve *p) {
    unsigned b = p->b;
    unsigned delta = p->a - 2 * b - p->c;
    unsigned span = p->hi - p->margin;
    return b + p->base + func_020b3a7c(p->lo * delta + (span >> 1), span);
}



