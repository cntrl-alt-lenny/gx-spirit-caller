typedef long long s64;
struct M44 { int m[16]; };
void func_0208b980(struct M44 *a, struct M44 *b, struct M44 *out)
{
    struct M44 tmp;
    struct M44 *dst = out;
    int x, y, z, w;
    int bx, by, bz, bw;
    if (out == b) dst = &tmp;
    x = a->m[0]; y = a->m[1]; z = a->m[2]; w = a->m[3];
    dst->m[0] = (int)(((s64)x*b->m[0] + (s64)y*b->m[4] + (s64)z*b->m[8] + (s64)w*b->m[12]) >> 12);
    dst->m[1] = (int)(((s64)x*b->m[1] + (s64)y*b->m[5] + (s64)z*b->m[9] + (s64)w*b->m[13]) >> 12);
    dst->m[3] = (int)(((s64)x*b->m[3] + (s64)y*b->m[7] + (s64)z*b->m[11] + (s64)w*b->m[15]) >> 12);
    bx = b->m[2]; by = b->m[6]; bz = b->m[10]; bw = b->m[14];
    dst->m[2] = (int)(((s64)x*bx + (s64)y*by + (s64)z*bz + (s64)w*bw) >> 12);
    x = a->m[4]; y = a->m[5]; z = a->m[6]; w = a->m[7];
    dst->m[6] = (int)(((s64)x*bx + (s64)y*by + (s64)z*bz + (s64)w*bw) >> 12);
    dst->m[5] = (int)(((s64)x*b->m[1] + (s64)y*b->m[5] + (s64)z*b->m[9] + (s64)w*b->m[13]) >> 12);
    dst->m[7] = (int)(((s64)x*b->m[3] + (s64)y*b->m[7] + (s64)z*b->m[11] + (s64)w*b->m[15]) >> 12);
    bx = b->m[0]; by = b->m[4]; bz = b->m[8]; bw = b->m[12];
    dst->m[4] = (int)(((s64)x*bx + (s64)y*by + (s64)z*bz + (s64)w*bw) >> 12);
    x = a->m[8]; y = a->m[9]; z = a->m[10]; w = a->m[11];
    dst->m[8] = (int)(((s64)x*bx + (s64)y*by + (s64)z*bz + (s64)w*bw) >> 12);
    dst->m[9] = (int)(((s64)x*b->m[1] + (s64)y*b->m[5] + (s64)z*b->m[9] + (s64)w*b->m[13]) >> 12);
    dst->m[11] = (int)(((s64)x*b->m[3] + (s64)y*b->m[7] + (s64)z*b->m[11] + (s64)w*b->m[15]) >> 12);
    bx = b->m[2]; by = b->m[6]; bz = b->m[10]; bw = b->m[14];
    dst->m[10] = (int)(((s64)x*bx + (s64)y*by + (s64)z*bz + (s64)w*bw) >> 12);
    x = a->m[12]; y = a->m[13]; z = a->m[14]; w = a->m[15];
    dst->m[14] = (int)(((s64)x*bx + (s64)y*by + (s64)z*bz + (s64)w*bw) >> 12);
    dst->m[13] = (int)(((s64)x*b->m[1] + (s64)y*b->m[5] + (s64)z*b->m[9] + (s64)w*b->m[13]) >> 12);
    dst->m[12] = (int)(((s64)x*b->m[0] + (s64)y*b->m[4] + (s64)z*b->m[8] + (s64)w*b->m[12]) >> 12);
    dst->m[15] = (int)(((s64)x*b->m[3] + (s64)y*b->m[7] + (s64)z*b->m[11] + (s64)w*b->m[15]) >> 12);
    if (dst == &tmp) *out = tmp;
}

