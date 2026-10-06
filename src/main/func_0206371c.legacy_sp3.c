typedef struct {
    char           _0[0x8];
    unsigned short seq;
} elem_0206371c_t;

typedef struct {
    char  _0[0x60];
    void *list;
} obj_0206371c_t;

extern void *func_020644a4(int p1, int zero);
extern int func_020643d8(void *self);
extern int func_02054140(void *p);
extern void *func_020540d0(char *s, int index);
extern int func_02064480(unsigned int a, unsigned int b);
extern int func_02062834(obj_0206371c_t *o, elem_0206371c_t *e);

int func_0206371c(obj_0206371c_t *o, unsigned char *p, int len) {
    elem_0206371c_t *e;
    unsigned int lo;
    unsigned int hi;
    int n;
    int i;

    lo = (unsigned int)func_020644a4((int)p, 0);
    if (len == 2) {
        hi = lo;
    } else if (len == 4) {
        hi = (unsigned int)func_020644a4((int)p, 2);
    } else {
        return func_020643d8(o) != 0;
    }
    n = func_02054140(o->list);
    for (i = 0; i < n; i++) {
        e = func_020540d0(o->list, i);
        if (func_02064480(e->seq, lo) >= 0 && func_02064480(e->seq, hi) <= 0) {
            if (func_02062834(o, e) == 0) {
                return 0;
            }
        }
    }
    return 1;
}
