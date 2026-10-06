typedef struct {
    int off;
    int len;
    int _8;
    int time;
} elem_02062834_t;

typedef struct {
    char           _0[0x50];
    unsigned char *buf;
    char           _54[0x12];
    unsigned short f66;
    char           _68[0x20];
    int            f88;
    int            f8c;
} obj_02062834_t;

extern void func_02064490(char *p, int idx, int hw);
extern int func_02062280(void *self, int a, int b);

int func_02062834(obj_02062834_t *o, elem_02062834_t *e) {
    func_02064490((char *)o->buf, e->off + 5, o->f66);
    if (func_02062280(o, (int)(o->buf + e->off), e->len) == 0) {
        return 0;
    }
    e->time = o->f88;
    if (o->buf[e->off + 2] == 2) {
        o->f8c = o->f88;
    }
    return 1;
}
