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
    signed char a,b,c,d;
    short e,f,g;
    unsigned short h;
    int i,j;
} entry_t;
typedef struct {
    entry_t first, second;
    bits_t flags;
    short count;
} state_t;
extern int func_ov002_021c9504(int player, int kind, int extra);
extern int func_ov002_021c988c(int player, int kind, int extra);
extern void func_ov002_0229d184(obj_t *p, int arg1, bits_t *arg2);
void func_ov002_0229ed30(state_t *p, entry_t *src, int force) {
    bits_t flags;
    if (force != 0 || p->count == 0) {
        p->first.a = src->a;
        p->first.b = src->b;
        p->first.c = src->c;
        p->first.d = src->d;
        p->first.e = src->e;
        p->first.f = src->f;
        p->first.g = src->g;
        p->first.h = src->h;
        p->first.i = src->i;
        p->first.j = src->j;
        p->count++;
        if (p->count > 1) {
            flags = p->flags;
            flags.c = (unsigned short)(flags.b == 13 ? 1 : p->count - 2);
            flags.d = (unsigned short)func_ov002_021c988c(flags.a, flags.b, flags.c);
            flags.e = 0;
            func_ov002_0229d184((obj_t *)&p->second, func_ov002_021c9504(flags.a, flags.b, flags.c), &flags);
        }
    } else {
        p->second.a = src->a;
        p->second.b = src->b;
        p->second.c = src->c;
        p->second.d = src->d;
        p->second.e = src->e;
        p->second.f = src->f;
        p->second.g = src->g;
        p->second.h = src->h;
        p->second.i = src->i;
        p->second.j = src->j;
        p->count++;
    }
}

