typedef long long s64;
struct M43 { int m[12]; };
void func_0208b32c(struct M43 *a, struct M43 *b, struct M43 *out)
{
    struct M43 tmp;
    struct M43 *dst = out;
    int x, y, z;
    int bx, by, bz;
    if (out == b) dst = &tmp;
    x = a->m[0]; y = a->m[1]; z = a->m[2];
    dst->m[0] = (int)(((s64)x*b->m[0] + (s64)y*b->m[3] + (s64)z*b->m[6]) >> 12);
    dst->m[1] = (int)(((s64)x*b->m[1] + (s64)y*b->m[4] + (s64)z*b->m[7]) >> 12);
    bx = b->m[2]; by = b->m[5]; bz = b->m[8];
    dst->m[2] = (int)(((s64)x*bx + (s64)y*by + (s64)z*bz) >> 12);
    x = a->m[3]; y = a->m[4]; z = a->m[5];
    dst->m[5] = (int)(((s64)x*bx + (s64)y*by + (s64)z*bz) >> 12);
    dst->m[4] = (int)(((s64)x*b->m[1] + (s64)y*b->m[4] + (s64)z*b->m[7]) >> 12);
    bx = b->m[0]; by = b->m[3]; bz = b->m[6];
    dst->m[3] = (int)(((s64)x*bx + (s64)y*by + (s64)z*bz) >> 12);
    x = a->m[6]; y = a->m[7]; z = a->m[8];
    dst->m[6] = (int)(((s64)x*bx + (s64)y*by + (s64)z*bz) >> 12);
    dst->m[7] = (int)(((s64)x*b->m[1] + (s64)y*b->m[4] + (s64)z*b->m[7]) >> 12);
    bx = b->m[2]; by = b->m[5]; bz = b->m[8];
    dst->m[8] = (int)(((s64)x*bx + (s64)y*by + (s64)z*bz) >> 12);
    x = a->m[9]; y = a->m[10]; z = a->m[11];
    dst->m[11] = (int)(b->m[11] + (((s64)x*bx + (s64)y*by + (s64)z*bz) >> 12));
    dst->m[10] = (int)(b->m[10] + (((s64)x*b->m[1] + (s64)y*b->m[4] + (s64)z*b->m[7]) >> 12));
    dst->m[9] = (int)(b->m[9] + (((s64)x*b->m[0] + (s64)y*b->m[3] + (s64)z*b->m[6]) >> 12));
    if (dst == &tmp) *out = tmp;
}





