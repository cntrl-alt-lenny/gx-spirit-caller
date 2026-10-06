typedef struct {
    int v[4];
} quad_02062320_t;

typedef struct {
    char            _0[0xc];
    int             state;
    char            _10[0x4];
    int             f14;
    char            _18[0x10];
    quad_02062320_t f28;
} obj_02062320_t;

extern void func_02062c18(obj_02062320_t *o);

int func_02062320(obj_02062320_t *o, quad_02062320_t *src) {
    if (o->f14 != 0) {
        o->f14 = 0;
        return 0;
    }
    o->f14 = 0;
    if (o->state != 4) {
        return 0;
    }
    func_02062c18(o);
    o->state = 5;
    if (src != 0) {
        o->f28 = *src;
    }
    return 1;
}
