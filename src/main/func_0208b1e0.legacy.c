typedef long long s64;

struct M33 { int m[9]; };

void func_0208b1e0(struct M33 *src, struct M33 *dst, int x, int y, int z)
{
    dst->m[0] = (int)(((s64)x * src->m[0]) >> 12);
    dst->m[1] = (int)(((s64)x * src->m[1]) >> 12);
    dst->m[2] = (int)(((s64)x * src->m[2]) >> 12);
    dst->m[3] = (int)(((s64)y * src->m[3]) >> 12);
    dst->m[4] = (int)(((s64)y * src->m[4]) >> 12);
    dst->m[5] = (int)(((s64)y * src->m[5]) >> 12);
    dst->m[6] = (int)(((s64)z * src->m[6]) >> 12);
    dst->m[7] = (int)(((s64)z * src->m[7]) >> 12);
    dst->m[8] = (int)(((s64)z * src->m[8]) >> 12);
}
