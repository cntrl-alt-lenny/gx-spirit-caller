typedef struct {
    unsigned kind;
    unsigned result;
    unsigned arg;
} Rec;

extern unsigned func_02021c30(unsigned a);
extern unsigned func_020234f8(unsigned a);
extern unsigned func_02024024(unsigned a);
extern unsigned func_02024574(unsigned a);
extern unsigned func_020270d0(unsigned a);
extern unsigned func_02028790(unsigned a);
extern unsigned func_0202a27c(unsigned a);

int func_02021a3c(char *base, unsigned *list) {
    int n;
    Rec *r;
    unsigned *p;
    r = (Rec *)(base + 0x18);
    p = list;
    p++;
    for (n = 0; n < 0x80; n++, r++) {
        unsigned w = *p;
        if ((w >> 24) == 0xf0) {
            break;
        }
        r->arg = w;
        r->kind = p[1];
        p += 2;
        switch (r->kind) {
        case 0:
            r->result = func_02021c30(r->arg);
            break;
        case 1:
            r->result = func_020234f8(r->arg);
            break;
        case 2:
            r->result = func_02024024(r->arg);
            break;
        case 3:
            r->result = func_02024574(r->arg);
            break;
        case 4:
            r->result = func_020270d0(r->arg);
            break;
        case 5:
            r->result = func_02028790(r->arg);
            break;
        case 6:
            r->result = func_0202a27c(r->arg);
            break;
        default:
            n--;
            r--;
            break;
        }
    }
    return n;
}
