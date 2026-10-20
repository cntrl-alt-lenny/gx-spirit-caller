typedef struct { int x, y; } vec_t;
typedef struct { short x, y; } point_t;
extern int func_ov011_021d22d4(vec_t a, vec_t b);
int func_ov011_021d2330(point_t a, point_t b) {
    vec_t va, vb;
    va.x = a.x << 12;
    va.y = a.y << 12;
    vb.x = b.x << 12;
    vb.y = b.y << 12;
    return func_ov011_021d22d4(va, vb);
}


