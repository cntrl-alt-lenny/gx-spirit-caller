typedef long long s64;

struct Vec { int x, y, z; };

int func_0208c3e4(struct Vec *a, struct Vec *b)
{
    s64 t = (s64)a->x * b->x + (s64)a->y * b->y + (s64)a->z * b->z;
    return (int)((t + 0x800) >> 12);
}
