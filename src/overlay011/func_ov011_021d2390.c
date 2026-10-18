typedef struct { int x, y; } vec_t;
typedef struct { short x, y; } point_t;
extern int func_ov011_021d22d4(vec_t a, vec_t b);
int func_ov011_021d2390(point_t *a, point_t *b, vec_t c) {
    vec_t vb, va;
    int ax = a->x << 12;
    int bx = b->x << 12;
    int by = b->y << 12;
    int ay = a->y << 12;
    int da, db;
    vb.x = bx; vb.y = by;
    va.x = ax; va.y = ay;
    da = func_ov011_021d22d4(va, c);
    db = func_ov011_021d22d4(vb, c);
    return func_ov011_021d22d4(vb, va) - (db - da);
}

