typedef struct { int x, y; } vec_t;
typedef struct { short x, y; } point_t;
void func_ov011_021d2290(point_t *out, vec_t in) {
    point_t tmp;
    tmp.x = in.x >> 16;
    tmp.y = in.y >> 16;
    *out = tmp;
}
