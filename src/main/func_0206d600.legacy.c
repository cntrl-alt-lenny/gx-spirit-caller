typedef struct {
    char _0[0xa];
    unsigned short sid;
    char _c[0x5c];
    char *owner;
    char _6c[0x4];
    char _70[0x3];
    signed char mode;
    unsigned short id;
    unsigned short id2;
    int ptr;
} Sock_0206d600_t;

typedef struct {
    char _0[0xf8];
    int size;
    char *base;
    unsigned short cnt;
    char _102[0xa];
    void *list;
} Own_0206d600_t;

typedef struct {
    char _0[0xd];
    char kind;
    char _e[2];
    char *p1;
    int n1;
    char *p2;
    int n2;
    unsigned short cnt;
    char _22[2];
    unsigned short id;
    unsigned short id2;
    int ptr;
} Req_0206d600_t;

extern Req_0206d600_t *func_0206bf94(void *a0, void *a1, int a2);
extern int func_0206be44(void *a0, void *a1);
extern int func_0206d4c0(void *rb);
extern unsigned short func_0207108c(void);
extern void func_02094688(void *dst, void *src, int n);

int func_0206d600(Sock_0206d600_t *s, char *buf, int len, int off,
                  unsigned short a4, int a5, int flags) {
    Own_0206d600_t *o = (Own_0206d600_t *)s->owner;
    Req_0206d600_t *r;
    int size;
    char *base;
    unsigned short saved;

    r = func_0206bf94((void *)func_0206d4c0, o->list, flags);
    if (r == 0) {
        return -0x21;
    }
    if ((flags & 1) && s->mode != 1) {
        r->kind = 3;
    } else {
        r->kind = 0;
    }
    base = o->base;
    size = o->size;
    if (off + len < size) {
        r->p1 = base + off;
        r->n1 = len;
        r->p2 = 0;
        r->n2 = 0;
        off = off + len;
    } else {
        r->p1 = base + off;
        r->n1 = size - off;
        r->p2 = base;
        r->n2 = len - r->n1;
        off = r->n2;
        func_02094688(buf + r->n1, r->p2, off);
    }
    func_02094688(buf, r->p1, r->n1);
    saved = o->cnt;
    r->cnt = off;
    o->cnt = r->cnt;
    if (s->mode == 1) {
        if (s->id == 0) {
            s->id = func_0207108c();
            s->sid = s->id;
        }
        r->id = s->id;
        if (s->ptr == 0 || a5 != 0) {
            r->ptr = a5;
            r->id2 = a4;
        } else {
            r->ptr = s->ptr;
            r->id2 = s->id2;
        }
    } else {
        r->ptr = 0;
    }
    if (func_0206be44(o->list, r) != 0) {
        o->cnt = saved;
        len = 0;
    }
    return len;
}
