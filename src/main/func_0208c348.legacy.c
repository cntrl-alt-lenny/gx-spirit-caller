typedef long long s64;
struct Vec { int x, y, z; };
void func_0208c348(struct Vec *a, struct Vec *b, struct Vec *out)
{
    s64 x = (s64)a->y * b->z - (s64)a->z * b->y;
    s64 y = (s64)a->z * b->x - (s64)a->x * b->z;
    s64 z = (s64)a->x * b->y - (s64)a->y * b->x;
    out->x = (int)((x + 0x800) >> 12);
    out->y = (int)((y + 0x800) >> 12);
    out->z = (int)((z + 0x800) >> 12);
}
