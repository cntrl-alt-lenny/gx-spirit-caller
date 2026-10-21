typedef long long s64;
typedef struct { int x, y; } vec_t;
extern int func_0208bf3c(int x);
int func_ov011_021d22d4(vec_t a, vec_t b) {
    int ay = a.y;
    int by = b.y;
    int dy = by - ay;
    int dx = b.x - a.x;
    return func_0208bf3c((int)(((s64)dx * dx + 0x800) >> 12) + (int)(((s64)dy * dy + 0x800) >> 12));
}
