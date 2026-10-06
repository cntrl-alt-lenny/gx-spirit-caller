typedef struct {
    char         _0[0xc];
    int          closed;
    char         _10[0xc];
    unsigned int start;
    unsigned int timeout;
} conn_02063188_t;

typedef struct {
    char _0[0x2c];
    int  f2c;
} obj_02063188_t;

extern int *func_02064d10(void *p, int a, short b);
extern int func_02061670(obj_02063188_t *o, conn_02063188_t *c, int a, short b, int e, int f, int g, int h);
extern int func_02055330(void);
extern int func_020643ec(void *self, int a, int b);

int func_02063188(obj_02063188_t *o, int a, short b) {
    conn_02063188_t *c = (conn_02063188_t *)func_02064d10(o, a, b);

    if (o->f2c != 0 && func_02061670(o, c, a, b, 1, 0, 0, 0) == 0) {
        return 0;
    }
    if (c == 0) {
        return 1;
    }
    if (c->closed == 0) {
        if (c->timeout == 0 || func_02055330() - c->start < c->timeout) {
            return 1;
        }
        if (func_020643ec(c, 6, 1) == 0) {
            return 0;
        }
    } else if (func_020643ec(c, 2, 1) == 0) {
        return 0;
    }
    return 1;
}
