typedef struct {
    char          _0[0x68];
    char         *owner;
    char          _6c[0x4];
    volatile short flags;
    signed char    mode;
} sock_0206dad8_t;

extern int func_0206e4a4(int a0);
extern void *func_0206bf94(void *a0, char *a1, int a2);
extern int func_0206da98(void *p);
extern int func_0206be44(int *p, void *req);

int func_0206dad8(sock_0206dad8_t *s) {
    char *o;
    void *r;

    if (func_0206e4a4((int)s) != 0) {
        return -0x1c;
    }
    int flag = 0;
    if (s != 0) {
        flag = (s->flags & 0x1) != 0;
    }
    if (!flag) {
        return -0x27;
    }
    if (!(s->flags & 0x4) || (s->flags & 0x8)) {
        return -0x38;
    }
    s->flags |= 0x8;
    o = s->owner;
    if (o != 0 && *(char **)(o + 0x10c) != 0) {
        r = func_0206bf94((void *)func_0206da98, *(char **)(o + 0x10c), s->mode);
        if (r == 0) {
            return -0x21;
        }
        return func_0206be44(*(int **)(o + 0x10c), r);
    }
    return 0;
}
