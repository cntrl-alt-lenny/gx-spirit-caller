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
    unsigned : 9;
    unsigned end : 9;
    unsigned : 6;
};
extern unsigned func_020b3a7c(unsigned, unsigned);
unsigned func_ov000_021abec8(struct Ov000Curve *p) {
    int b = p->b;
    int delta = p->end - (b + p->base);
    int span = p->hi - p->margin;
    int product = delta * span;
    int denominator = p->a - 2 * b - p->c;
    return func_020b3a7c(product + denominator / 2, denominator);
}
