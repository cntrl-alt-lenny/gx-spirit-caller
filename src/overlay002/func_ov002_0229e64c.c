typedef struct {
    unsigned short a:1;
    unsigned short b:5;
    unsigned short c:8;
    unsigned short d:1;
    unsigned short e:1;
} bits_t;
typedef struct {
    unsigned char f_0, _p1, f_2, f_3;
    unsigned short _p4, f_6, f_8;
    bits_t f_a;
    int f_c, f_10;
} obj_t;
typedef struct {
    obj_t first;
    obj_t second;
    bits_t bits;
    short count;
} state_t;
extern int func_ov002_021b00e8(int player, int type);
extern int func_ov002_021c9504(int player, int kind, int extra);
extern int func_ov002_021c988c(int player, int kind, int extra);
extern void func_ov002_0229d184(obj_t *p, int arg1, bits_t *arg2);
void func_ov002_0229e64c(state_t *p) {
    bits_t bits;
    p->count = func_ov002_021b00e8(p->bits.a, p->bits.b);
    if (p->count != 0) {
        p->bits.c = (unsigned short)(p->bits.b == 13 ? 0 : p->count - 1);
        p->bits.d = (unsigned short)func_ov002_021c988c(p->bits.a, p->bits.b, p->bits.c);
        p->bits.e = 0;
        func_ov002_0229d184(&p->first, func_ov002_021c9504(p->bits.a, p->bits.b, p->bits.c), &p->bits);
        if (p->count <= 1) return;
        bits = p->bits;
        bits.c = (unsigned short)(bits.b == 13 ? 1 : p->count - 2);
        bits.d = (unsigned short)func_ov002_021c988c(bits.a, bits.b, bits.c);
        bits.e = 0;
        func_ov002_0229d184(&p->second, func_ov002_021c9504(bits.a, bits.b, bits.c), &bits);
    } else {
        p->bits.c = 0;
        p->first.f_0 = 0;
    }
}

