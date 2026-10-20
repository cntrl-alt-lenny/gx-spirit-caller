typedef struct {
    unsigned short a:1, b:5, c:8, d:1, e:1;
} bits_t;
typedef struct {
    unsigned char f_0, _p1, f_2, f_3;
    unsigned short _p4, f_6, f_8;
    bits_t f_a;
    int f_c, f_10;
} obj_t;
typedef struct {
    obj_t first, second;
    bits_t flags;
    short count;
} state_t;
extern int func_ov002_021c9504(int player, int kind, int extra);
extern int func_ov002_021c988c(int player, int kind, int extra);
extern void func_ov002_0229d184(obj_t *p, int arg1, bits_t *arg2);
void func_ov002_0229eedc(state_t *p) {
    bits_t flags;
    p->count--;
    if (p->count != 0) {
        p->flags.c = (unsigned short)(p->flags.b == 13 ? 0 : p->count - 1);
        p->flags.d = (unsigned short)func_ov002_021c988c(p->flags.a, p->flags.b, p->flags.c);
        p->flags.e = 0;
        func_ov002_0229d184(&p->first, func_ov002_021c9504(p->flags.a, p->flags.b, p->flags.c), &p->flags);
        if (p->count > 1) {
            flags = p->flags;
            flags.c = (unsigned short)(flags.b == 13 ? 1 : p->count - 2);
            flags.d = (unsigned short)func_ov002_021c988c(flags.a, flags.b, flags.c);
            flags.e = 0;
            func_ov002_0229d184(&p->second, func_ov002_021c9504(flags.a, flags.b, flags.c), &flags);
        }
    } else {
        p->first.f_0 = 0;
    }
}
