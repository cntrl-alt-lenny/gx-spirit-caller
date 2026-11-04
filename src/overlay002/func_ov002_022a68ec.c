typedef unsigned short u16;
typedef struct { u16 a:1,b:5,c:8,d:1,e:1; } Bits;
typedef struct { signed char a,b,c,d; short e,f,g; Bits h; int i,j; } Entry;
extern void *func_ov002_022a6324(char *base, int idx, int type, int sub);
static inline int flagD(Bits *v) { return v->d; }
static inline int flagE(Bits *v) { return v->e; }
static inline void copy(Entry *dst, Entry *src) {
    dst->a=src->a; dst->b=src->b; dst->c=src->c; dst->d=src->d;
    dst->e=src->e; dst->f=src->f; dst->g=src->g; dst->h=src->h; dst->i=src->i; dst->j=src->j;
}
void func_ov002_022a68ec(char *base, Bits *src, Bits *dst) {
    Entry *p, *q;
    int tmp[5];
    p = func_ov002_022a6324(base, src->a, src->b, src->c);
    q = func_ov002_022a6324(base, dst->a, dst->b, dst->c);
    copy((Entry *)tmp,p); copy(p,q); copy(q,(Entry *)tmp);
    {
        Bits flags = p->h;
        Bits newFlags = *src;
        newFlags.d = (u16)flagD(&flags);
        newFlags.e = (u16)flagE(&flags);
        p->h = newFlags;
        p->e = 8;
    }
    {
        Bits newFlags; Bits flags = q->h; newFlags = *dst;
        newFlags.d = (u16)flagD(&flags);
        newFlags.e = (u16)flagE(&flags);
        q->h = newFlags;
        q->e = 8;
    }
}








