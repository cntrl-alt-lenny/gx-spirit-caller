typedef long long s64;

struct Mtx { int m[16]; };

extern void MI_Copy48B(struct Mtx *src, struct Mtx *dst);

void func_0208bca4(struct Mtx *src, struct Mtx *dst, int x, int y, int z)
{
    if (src != dst) {
        MI_Copy48B(src, dst);
    }
    dst->m[12] = src->m[12] + (int)(((s64)x * src->m[0] + (s64)y * src->m[4] + (s64)z * src->m[8]) >> 12);
    dst->m[13] = src->m[13] + (int)(((s64)x * src->m[1] + (s64)y * src->m[5] + (s64)z * src->m[9]) >> 12);
    dst->m[14] = src->m[14] + (int)(((s64)x * src->m[2] + (s64)y * src->m[6] + (s64)z * src->m[10]) >> 12);
    dst->m[15] = src->m[15] + (int)(((s64)x * src->m[3] + (s64)y * src->m[7] + (s64)z * src->m[11]) >> 12);
}
