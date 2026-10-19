struct Ov000Curve {
    unsigned active : 1;
    unsigned enabled : 1;
    unsigned : 4;
    unsigned start : 9;
    unsigned base : 9;
    unsigned type : 8;
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
    unsigned extra;
};
/* Fill32's assembly implementation consumes r0-r2. */
extern void Fill32(unsigned int value, void *dest, int size_bytes);
void func_ov000_021abd50(struct Ov000Curve *p, int start, int base, int type,
                      int a, int b, int c, int hi, int margin) {
    Fill32(0, p, 0x14);
    p->start = start;
    p->base = base;
    p->type = (unsigned char)type;
    p->a = (unsigned char)a;
    p->b = (unsigned char)b;
    p->c = (unsigned char)c;
    p->hi = (unsigned short)hi;
    p->margin = (unsigned char)margin;
    p->end = base + b;
    p->active = 1;
    p->enabled = 1;
}

